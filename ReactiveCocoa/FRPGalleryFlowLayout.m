//
//  FRPGalleryFlowLayout.m
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/28/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "FRPGalleryFlowLayout.h"

@implementation FRPGalleryFlowLayout

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return self;
}

@end
