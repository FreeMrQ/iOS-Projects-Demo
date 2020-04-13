//
//  LWJButton.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWJButton : UIButton
typedef void(^ClickEvent)(LWJButton *btn);
@property(nonatomic, copy, readonly)LWJButton* (^setTag)(NSInteger tag);
@property(nonatomic, copy, readonly)LWJButton* (^setFrame)(CGRect rect);
@property(nonatomic, copy, readonly)LWJButton* (^setBgColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJButton* (^setTitle)(NSString *content, UIControlState state);
@property(nonatomic, copy, readonly)LWJButton* (^setTitleFont)(UIFont *font);
@property(nonatomic, copy, readonly)LWJButton* (^setTitleColor)(UIColor *color, UIControlState state);
@property(nonatomic, copy, readonly)LWJButton* (^setAttrTitle)(NSAttributedString *content, UIControlState state);
@property(nonatomic, copy, readonly)LWJButton* (^setImage)(UIImage *img, UIControlState state);
@property(nonatomic, copy, readonly)LWJButton* (^setBgImage)(UIImage *img, UIControlState state);
@property(nonatomic,copy,readonly)LWJButton* (^setClickAction)(ClickEvent click,UIControlEvents events);
@property(nonatomic,copy,readonly)LWJButton* (^setDefaultClickAction)(ClickEvent click);
+ (LWJButton *)lwj_make:(void(^)(LWJButton *maker))maker;
@end

NS_ASSUME_NONNULL_END
