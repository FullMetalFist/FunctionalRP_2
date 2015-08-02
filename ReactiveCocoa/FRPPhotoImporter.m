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
    
    
    return subject;
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
