//
//  FlutterUsage.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/16.
//  Copyright © 2020 lance. All rights reserved.
//

#import "FlutterUsage.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"
@interface FlutterUsage ()

@end

@implementation FlutterUsage

- (void)viewDidLoad {
    [super viewDidLoad];
    LWJButton *btn = [LWJButton lwj_make:^(LWJButton * _Nonnull maker) {
        maker
        .setTag(1)
        .setFrame(CGRectMake(10, 100, 100, 50))
        .setBgColor(UIColor.blueColor)
        .setTitle(@"控件", UIControlStateNormal)
        .setDefaultClickAction(^(LWJButton * _Nonnull btn) {
             FlutterEngine *flutterEngine =
                 ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
             FlutterViewController *flutterViewController =
                 [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
            [self.navigationController pushViewController:flutterViewController animated:YES];
        })
        .setBorderColor(UIColor.greenColor)
        .setBorderWidth(2)
        .setCornerRadius(5);
        
    }];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
