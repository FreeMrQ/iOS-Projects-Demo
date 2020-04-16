//
//  AppDelegate.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/7.
//  Copyright © 2020 lance. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
    // Runs the default Dart entrypoint with a default Flutter route.
    [self.flutterEngine run];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    
    if(@available(iOS 13.0,*)){
        
    }else{
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.window setBackgroundColor:[UIColor whiteColor]];
        
        ViewController *vc = [[ViewController alloc] init];
        UINavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [self.window setRootViewController:nav];
        [self.window makeKeyAndVisible];
    }
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma clang diagnostic pop
@end
