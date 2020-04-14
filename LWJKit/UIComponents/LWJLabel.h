//
//  LWJLabel.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWJLabel : UILabel
@property(nonatomic, copy, readonly)LWJLabel* (^setTag)(NSInteger tag);
@property(nonatomic, copy, readonly)LWJLabel* (^setFrame)(CGRect rect);
@property(nonatomic, copy, readonly)LWJLabel* (^setBgColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJLabel* (^setText)(NSString *content);
@property(nonatomic, copy, readonly)LWJLabel* (^setAttrText)(NSAttributedString *content);
@property(nonatomic, copy, readonly)LWJLabel* (^setTextColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJLabel* (^setFont)(UIFont *font);
@property(nonatomic, copy, readonly)LWJLabel* (^setTextAlignment)(NSTextAlignment textAlignment);
@property(nonatomic, copy, readonly)LWJLabel* (^setLineBreakMode)(NSLineBreakMode lineBreakMode);
@property(nonatomic, copy, readonly)LWJLabel* (^setNumberOfLines)(NSInteger numberOfLines);
@property(nonatomic, copy, readonly)LWJLabel* (^setAdjustFontSizeToFitWidth)(BOOL adjustFontSizeToFitWidth);
+ (LWJLabel*)lwj_make:(void(^)(LWJLabel *maker))maker;
@end

NS_ASSUME_NONNULL_END
