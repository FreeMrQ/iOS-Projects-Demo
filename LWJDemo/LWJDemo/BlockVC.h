//
//  BlockVC.h
//  LWJDemo
//
//  Created by L.W.J on 2020/3/31.
//  Copyright © 2020 L.W.J. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickBlock)(NSInteger index);
@interface BlockVC : UIViewController
@property (nonatomic, copy) ClickBlock imageClickBlock;
-(void)defTest:(ClickBlock)block;
@end

NS_ASSUME_NONNULL_END
