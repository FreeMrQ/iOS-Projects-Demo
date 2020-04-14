//
//  LWJImageView.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "LWJImageView.h"

@implementation LWJImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 init
 */
+(LWJImageView*)lwj_make:(void (^)(LWJImageView * _Nonnull))maker{
    LWJImageView *iv = [[LWJImageView alloc] init];
    if(maker){
        maker(iv);
    }
    return iv;
}

/*
 设置Tag
 */
-(LWJImageView* (^)(NSInteger tag))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{}

/*
设置布局
 */
-(LWJImageView* (^)(CGRect rect))setFrame{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(void)setSetFrame:(LWJImageView * _Nonnull (^ _Nonnull)(CGRect))setFrame{}


/*
 设置图片
 */
-(LWJImageView* (^)(UIImage* image))setImage{
    return ^(UIImage* image){
        self.image = image;
        return self;
    };
    
}

-(void)setSetImage:(LWJImageView * _Nonnull (^ _Nonnull)(UIImage * _Nonnull))setImage{}

@end
