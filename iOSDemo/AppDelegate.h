//
//  AppDelegate.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/7.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>


@interface AppDelegate : FlutterAppDelegate <UIApplicationDelegate>
@property(nonatomic,strong)UIWindow *window;
@property (nonatomic,strong) FlutterEngine *flutterEngine;
@end

