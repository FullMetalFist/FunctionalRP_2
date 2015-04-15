//
//  AppDelegate.m
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/9/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "AppDelegate.h"

#import "RootSampleViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface AppDelegate ()

@property (nonatomic) RootSampleViewController *rootViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.rootViewController = [[RootSampleViewController alloc] initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    
    // rac_sequence
    NSArray *array = @[@1, @2, @3];

//    NSLog(@"%@", [[[array rac_sequence] map:^id(id value) {
//        return @(pow([value integerValue], 2));
//    }] array]);
    
//    NSLog(@"%@", [[[array rac_sequence] filter:^BOOL(id value) {
//        return [value integerValue] % 2 == 0;
//    }] array]);
    
    NSLog(@"%@", [[[array rac_sequence] map:^id(id value) {
        return [value stringValue];
    }] foldLeftWithStart:@"" reduce:^id(id accumulator, id value) {
        return [accumulator stringByAppendingString:value];
    }]);
    
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
