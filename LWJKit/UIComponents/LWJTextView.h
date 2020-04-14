//
//  LWJTextView.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWJTextView : UITextView
typedef void (^TVBeginEditBlock)(LWJTextView *tv);
typedef void (^TVChangeEditBlock)(LWJTextView *tv);
typedef void (^TVEndEditBlock)(LWJTextView *tv);
@property(nonatomic, copy, readonly)LWJTextView* (^beginEdit)(TVBeginEditBlock tvBeginEdit);
@property(nonatomic, copy, readonly)LWJTextView* (^changeEdit)(TVChangeEditBlock tvChangeEdit);
@property(nonatomic, copy, readonly)LWJTextView* (^endEdit)(TVEndEditBlock tvEndEdit);
@property(nonatomic, copy, readonly)LWJTextView* (^setTag)(NSInteger tag);
@property(nonatomic, copy, readonly)LWJTextView* (^setFrame)(CGRect rect);
@property(nonatomic, copy, readonly)LWJTextView* (^setBgColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJTextView* (^setText)(NSString *content);
@property(nonatomic, copy, readonly)LWJTextView* (^setAttrText)(NSAttributedString *content);
@property(nonatomic, copy, readonly)LWJTextView* (^setTextColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJTextView* (^setFont)(UIFont *font);
@property(nonatomic, copy, readonly)LWJTextView* (^setTextAlignment)(NSTextAlignment textAlignment);
+(LWJTextView*)lwj_make:(void(^)(LWJTextView *maker)) maker;
@end

NS_ASSUME_NONNULL_END
