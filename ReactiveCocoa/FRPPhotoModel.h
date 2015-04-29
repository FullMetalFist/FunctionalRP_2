//
//  FRPPhotoModel.h
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/29/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPPhotoModel : NSObject

@property (nonatomic) NSString *photoName;
@property (nonatomic) NSNumber *identifier;
@property (nonatomic) NSString *photographerName;
@property (nonatomic) NSNumber *rating;
@property (nonatomic) NSString *thumbnailURL;
@property (nonatomic) NSData *thumbnailData;
@property (nonatomic) NSString *fullSizedURL;
@property (nonatomic) NSData *fullSizedData;

@end
