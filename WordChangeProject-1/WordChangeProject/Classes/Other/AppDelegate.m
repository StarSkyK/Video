//
//  AppDelegate.m
//  WordChangeProject
//
//  Created by kailun on 17/3/29.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "AppDelegate.h"
#import "KLTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc] init];
    self.window.frame =[UIScreen mainScreen].bounds;
    self.window.rootViewController =[[KLTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
   }


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
