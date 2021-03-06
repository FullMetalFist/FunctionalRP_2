//
//  AppDelegate.h
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <500px-iOS-api/PXAPI.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) PXAPIHelper *apiHelper;

@end

