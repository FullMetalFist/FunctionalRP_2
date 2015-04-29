//
//  FRPPhotoImporter.h
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/29/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FRPPhotoImporter : NSObject

+ (RACSignal *) importPhotos;

@end
