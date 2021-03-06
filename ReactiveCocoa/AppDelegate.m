//
//  AppDelegate.m
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "AppDelegate.h"

#import "FRPGalleryViewController.h"
#import "FRPGalleryFlowLayout.h"

@interface AppDelegate ()

@property (nonatomic) UINavigationController *navController;
@property (nonatomic) FRPGalleryViewController *galleryViewController;
@property (nonatomic) FRPGalleryFlowLayout *flowLayout;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.flowLayout = [[FRPGalleryFlowLayout alloc] init];
    self.galleryViewController = [[FRPGalleryViewController alloc] initWithCollectionViewLayout:self.flowLayout];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.galleryViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    self.apiHelper = [[PXAPIHelper alloc] initWithHost:nil consumerKey:@"aREaY0lpaF5W53N25x9mqefgSLhALFwtSoHMnFpA" consumerSecret:@"P61nsPv1DhUI81GseysqhTW6jqU3JX7H5XI6vgfl"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
