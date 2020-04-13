//
//  LWJButton.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "LWJButton.h"
#import <objc/runtime.h>

@implementation LWJButton
static char ActionTag;

/*
 init 
 */
+(LWJButton*)lwj_make:(void (^)(LWJButton * _Nonnull maker))maker{
    LWJButton *button = [[LWJButton alloc] init];
    if(maker){
        maker(button);
    }
    return button;
}

/*
 设置Tag
 */
-(LWJButton* (^)(NSInteger tag))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{};

/*
设置Frame
 */
-(LWJButton* (^)(CGRect rect))setFrame{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(void)setSetFrame:(LWJButton * _Nonnull (^)(CGRect))setFrame{}

/*
设置背景颜色
 */
-(LWJButton* (^)(UIColor *color))setBgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(void)setSetBgColor:(LWJButton * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setBgColor{}

/*
 设置不同状态的标题
 */
-(LWJButton * (^)(NSString *content, UIControlState state))setTitle{
    return ^(NSString *content, UIControlState state){
        [self setTitle:content forState:state];
        return self;
    };
}

-(void)setSetTitle:(LWJButton * _Nonnull (^ _Nonnull)(NSString * _Nonnull, UIControlState))setTitle{}

/*
设置标题字体
 */
-(LWJButton* (^)(UIFont *font))setTitleFont{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

-(void)setSetTitleFont:(LWJButton * _Nonnull (^ _Nonnull)(UIFont * _Nonnull))setTitleFont{}

/*
 设置标题在不同状态下的颜色
 */
-(LWJButton* (^)(UIColor *color, UIControlState state))setTitleColor{
    return ^(UIColor *color, UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

-(void)setSetTitleColor:(LWJButton * _Nonnull (^ _Nonnull)(UIColor * _Nonnull, UIControlState))setTitleColor{}

/*
 设置不同状态下的富文本标题
 */
-(LWJButton* (^)(NSAttributedString *content, UIControlState state))setAttrTitle{
    return ^(NSAttributedString *content, UIControlState state){
        [self setAttributedTitle:content forState:state];
        return self;
    };
}


-(void)setSetAttrTitle:(LWJButton * _Nonnull (^ _Nonnull)(NSAttributedString * _Nonnull, UIControlState))setAttrTitle{}

/*
 设置填充图片
 */
-(LWJButton* (^)(UIImage *img, UIControlState state))setImage{
    return ^(UIImage *img, UIControlState state){
        [self setImage:img forState:state];
        return self;
    };
}

-(void)setSetImage:(LWJButton * _Nonnull (^ _Nonnull)(UIImage * _Nonnull, UIControlState))setImage{}

/*
 设置不同状态下的背景图片
 */
-(LWJButton* (^)(UIImage *img, UIControlState state))setBgImage{
    return ^(UIImage *img, UIControlState state){
        [self setBackgroundImage:img forState:state];
        return self;
    };
}

-(void)setSetBgImage:(LWJButton * _Nonnull (^ _Nonnull)(UIImage * _Nonnull, UIControlState))setBgImage{}

/*
 不同动作下的点击事件
 */
-(LWJButton* (^)(ClickEvent click,UIControlEvents events))setClickAction{
    return ^(ClickEvent click,UIControlEvents events){
        objc_setAssociatedObject(self, &ActionTag, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(action:) forControlEvents:events];
        return self;
    };
}

-(void)setSetClickAction:(LWJButton * _Nonnull (^)(ClickEvent _Nonnull, UIControlEvents))setClickAction{}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 默认点击事件-弹起
 */
-(LWJButton* (^) (ClickEvent click))setDefaultClickAction{
    return ^(ClickEvent click){
        objc_setAssociatedObject(self, &ActionTag, click, OBJC_ASSOCIATION_COPY_NONATOMIC);
               [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
               return self;
    };
}

-(void)setSetDefaultClickAction:(LWJButton * _Nonnull (^ _Nonnull)(ClickEvent _Nonnull))setDefaultClickAction{};


- (void)action:(id)sender {
     ClickEvent block= (ClickEvent)objc_getAssociatedObject(self, &ActionTag);
    if (block) {
        block(self);
    }
}

@end
