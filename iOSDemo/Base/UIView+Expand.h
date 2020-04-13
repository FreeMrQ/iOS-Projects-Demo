//
//  UIView+Expand.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Expand)
+(void)removeAllSubViews:(UIView *)parentView;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic,copy) UIView* (^setCornerRadius)(CGFloat radius);
@property (nonatomic,copy) UIView* (^setBorderWidth)(CGFloat borderWidth);
@property (nonatomic,copy) UIView* (^setBorderColor)(UIColor* borderColor);
@property (nonatomic,copy) UIView* (^setTag)(NSInteger tag);
@property (nonatomic,copy) UIView* (^setBackgroundColor)(UIColor* bgColor);
@end

NS_ASSUME_NONNULL_END
