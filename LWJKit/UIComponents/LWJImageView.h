//
//  LWJImageView.h
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWJImageView : UIImageView
@property(nonatomic, copy, readonly)LWJImageView* (^setTag)(NSInteger tag);
@property(nonatomic, copy, readonly)LWJImageView* (^setFrame)(CGRect rect);
@property(nonatomic, copy, readonly)LWJImageView* (^setImage)(UIImage* image);
+ (LWJImageView*)lwj_make:(void(^)(LWJImageView *maker))maker;
@end

NS_ASSUME_NONNULL_END
