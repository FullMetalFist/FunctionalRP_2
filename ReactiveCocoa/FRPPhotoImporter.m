//
//  FRPPhotoImporter.m
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/29/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "FRPPhotoImporter.h"
#import "FRPPhotoModel.h"
#import "AppDelegate.h"

@implementation FRPPhotoImporter

+ (RACReplaySubject *) importPhotos
{
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    NSURLRequest *request = [self popularURLRequest];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [subject sendNext:[[[results[@"photos"] rac_sequence] map:^id(NSDictionary *photoDictionary) {
                FRPPhotoModel *model = [FRPPhotoModel new];
                [self configurePhotoModel:model withDictionary:photoDictionary];
                [self downloadThumbnailForPhotoModel:model];
                return model;
            }] array]];
            [subject sendCompleted];
            
        }
        else {
            [subject sendError:connectionError];
        }
    }];
    
    return subject;
}

+ (NSURLRequest *) popularURLRequest
{
    return [AppDelegate.apiHelper urlRequestForPhotoFeature:[PXAPIHelperPhotoFeaturePopular resultsPerPage:100 page:0 photoSizes:PXPhotoSizeThumbnail sortOrder:PXAPIHelperSortOrderRating except:PXPhotoModelCategoryNude]];
}

+ (void) configurePhotoModel:(FRPPhotoModel *)photoModel withDictionary:(NSDictionary *)dictionary
{
    // basics details fetched with the first, basic request
    photoModel.photoName = dictionary[@"name"];
    photoModel.identifier = dictionary[@"id"];
    photoModel.photographerName = dictionary[@"user"][@"username"];
    photoModel.rating = dictionary[@"rating"];
    photoModel.thumbnailURL = [self urlForImageSize:3 inArray:dictionary[@"images"]];
    
    // extended attributes fetched with subsequent request
    if (dictionary[@"comments_count"]) {
        photoModel.fullSizedURL = [self urlForImageSize:4 inArray:dictionary[@"images"]];
    }
}

+ (NSString *)urlForImageSize:(NSInteger)size inDictionary:(NSArray *)array
{
    return [[[[[array rac_sequence] filter:^BOOL(NSDictionary *value) {
        return [value[@"size"] integerValue] == size;
    }] map:^id(id value) {
        return value[@"url"];
    }] array] firstObject];
}

+ (void)downloadThumbnailForPhotoModel:(FRPPhotoModel *)photoModel
{
    NSAssert(photoModel.thumbnailURL, @"Thumbnail URL must not be nil");
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:photoModel.thumbnailURL]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        photoModel.thumbnailData = data;
    }];
}

@end
