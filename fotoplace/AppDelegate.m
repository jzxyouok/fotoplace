//
//  AppDelegate.m
//  fotoplace
//
//  Created by MBP on 16/5/20.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MessageViewController.h"
#import "PersonViewController.h"
#import "PhotoViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[[Crashlytics class]]];
    
    [self initilaize];
    
    return YES;
}

- (void)initilaize {
    
    HomeViewController * hv = [[HomeViewController alloc] init];
    DiscoverViewController * dv = [[DiscoverViewController alloc] init];
    PhotoViewController * pov = [[PhotoViewController alloc] init];
    MessageViewController * mc = [[MessageViewController alloc] init];
    PersonViewController * pv = [[PersonViewController alloc] init];
    
    UINavigationController * hnv = [[UINavigationController alloc] initWithRootViewController:hv];
    hnv.navigationBarHidden = YES;
    UINavigationController * dnv = [[UINavigationController alloc] initWithRootViewController:dv];
    dnv.navigationBarHidden = YES;
    UINavigationController * ponv = [[UINavigationController alloc] initWithRootViewController:pov];
    ponv.navigationBarHidden = YES;
    UINavigationController * mnv = [[UINavigationController alloc] initWithRootViewController:mc];
    mnv.navigationBarHidden = YES;
    UINavigationController * pnv = [[UINavigationController alloc] initWithRootViewController:pv];
    pnv.navigationBarHidden = YES;
    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[hnv,dnv,ponv,mnv,pnv]];
    
    UITabBar * tabbar = tabBarController.tabBar;
    
    UITabBarItem * item1 = [tabbar.items objectAtIndex:0];
    UITabBarItem * item2 = [tabbar.items objectAtIndex:1];
    UITabBarItem * item3 = [tabbar.items objectAtIndex:2];
    UITabBarItem * item4 = [tabbar.items objectAtIndex:3];
    UITabBarItem * item5 = [tabbar.items objectAtIndex:4];
    
    item1.title = @"首页";
    item2.title = @"发现";
    item3.title = @"拍照";
    item4.title = @"消息";
    item5.title = @"个人";
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

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
