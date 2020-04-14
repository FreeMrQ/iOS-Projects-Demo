//
//  LWJTextField.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWJTextField : UITextField
typedef void (^TFBeginEditBlock)(LWJTextField *tf);
typedef void (^TFChangeEditBlock)(LWJTextField *tf);
typedef void (^TFEndEditBlock)(LWJTextField *tf);
typedef void (^TFKeyReturnBlock)(LWJTextField *tf);
@property(nonatomic, copy, readonly)LWJTextField* (^beginEdit)(TFBeginEditBlock tfBeginEdit);
@property(nonatomic, copy, readonly)LWJTextField* (^changeEdit)(TFChangeEditBlock tfChangeEdit);
@property(nonatomic, copy, readonly)LWJTextField* (^endEdit)(TFEndEditBlock tfEndEdit);
@property(nonatomic, copy, readonly)LWJTextField* (^keyReturn)(TFKeyReturnBlock tfKeyReturn);
@property(nonatomic, copy, readonly)LWJTextField* (^setTag)(NSInteger tag);
@property(nonatomic, copy, readonly)LWJTextField* (^setFrame)(CGRect rect);
@property(nonatomic, copy, readonly)LWJTextField* (^setBgColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJTextField* (^setText)(NSString *content);
@property(nonatomic, copy, readonly)LWJTextField* (^setAttrText)(NSAttributedString *content);
@property(nonatomic, copy, readonly)LWJTextField* (^setTextColor)(UIColor *color);
@property(nonatomic, copy, readonly)LWJTextField* (^setFont)(UIFont *font);
@property(nonatomic, copy, readonly)LWJTextField* (^setTextAlignment)(NSTextAlignment textAlignment);
@property(nonatomic, copy, readonly)LWJTextField* (^setAdjustFontSizeToFitWidth)(BOOL adjustFontSizeToFitWidth);
@property(nonatomic, copy, readonly)LWJTextField* (^setPlaceholder)(NSString *placeholder);
+(LWJTextField*)lwj_make:(void(^)(LWJTextField *maker)) maker;

@end

NS_ASSUME_NONNULL_END
