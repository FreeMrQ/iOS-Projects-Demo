//
//  UIUsage.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "UIUsage.h"
#import <Masonry/Masonry.h>
@interface UIUsage ()

@end

@implementation UIUsage

- (void)viewDidLoad {
    [super viewDidLoad];
    LWJButton *btn = [LWJButton lwj_make:^(LWJButton * _Nonnull maker) {
        maker
        .setTag(1)
        .setFrame(CGRectMake(10, 100, 100, 50))
        .setBgColor(UIColor.blueColor)
        .setTitle(@"控件", UIControlStateNormal)
        .setDefaultClickAction(^(LWJButton * _Nonnull btn) {
             NSLog(@"Test");
        })
        .setBorderColor(UIColor.greenColor)
        .setBorderWidth(2)
        .setCornerRadius(5);
        
    }];
    [self.view addSubview:btn];
    
//    LWJTextField *tf = [[LWJTextField alloc] initWithFrame:CGRectMake(btn.left, btn.bottom+10, btn.width, btn.height)];
//    tf
//    .didBeginEdit(^(LWJTextField * _Nonnull tf) {
//        NSLog(@"开始编辑");
//    })
//    .setBorderWidth(1)
//    .setBorderColor(UIColor.blueColor);
    LWJTextField *tv =  [LWJTextField lwj_make:^(LWJTextField * _Nonnull maker) {
        maker.setFrame(CGRectMake(btn.left, btn.bottom+10, btn.width, btn.height))
        .beginEdit(^(LWJTextField * _Nonnull tf) {
            NSLog(@"begin");
        })
        .changeEdit(^(LWJTextField * _Nonnull tf) {
            NSLog(@"change");
        })
        .endEdit(^(LWJTextField * _Nonnull tf) {
            NSLog(@"end");
        })
        .keyReturn(^(LWJTextField * _Nonnull tf) {
            NSLog(@"KeyReturn");
            [maker resignFirstResponder];
        })
        .setBorderColor(UIColor.blueColor)
        .setBorderWidth(2);
    }];
    [self.view addSubview:tv];
    
    
    
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
