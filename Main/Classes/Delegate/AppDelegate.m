//
//  AppDelegate.m
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import "AppDelegate.h"
#import "CategoryViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
   
    self.window.tintColor = [UIColor colorWithRed:0.0 green:0.6 blue:0.298 alpha:1.0];

    
    return YES;
}










- (void)saveData
{
    UINavigationController *navigationController = (UINavigationController *)self
    .window.rootViewController;
    CategoryViewController *controller = (CategoryViewController *)[
                                                                    navigationController.viewControllers objectAtIndex:0];
    [controller.dataModel saveChecklists];
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveData];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
