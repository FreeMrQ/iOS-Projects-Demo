//
//  LWJLabel.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "LWJLabel.h"

@implementation LWJLabel

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
+(LWJLabel*)lwj_make:(void (^)(LWJLabel * _Nonnull))maker{
    LWJLabel *lbl = [[LWJLabel alloc] init];
    if(maker){
        maker(lbl);
    }
    return lbl;
}

/*
 设置Tag
 */
-(LWJLabel* (^)(NSInteger tag))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{}

/*
设置布局
 */
-(LWJLabel* (^)(CGRect rect))setFrame{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(void)setSetFrame:(LWJLabel * _Nonnull (^ _Nonnull)(CGRect))setFrame{}

/*
 设置背景颜色
 */
-(LWJLabel* (^)(UIColor *color))setBgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(void)setSetBgColor:(LWJLabel * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setBgColor{}

/*
 设置文本内容
 */
-(LWJLabel* (^)(NSString *content))setText{
    return ^(NSString *content){
        self.text = content;
        return self;
    };
}

-(void)setSetText:(LWJLabel * _Nonnull (^ _Nonnull)(NSString * _Nonnull))setText{}


/*
 设置特殊文本内容
 */
-(LWJLabel* (^)(NSAttributedString *content))setAttrText{
    return ^(NSAttributedString *content){
        self.attributedText = content;
        return self;
    };
}

-(void)setSetAttrText:(LWJLabel * _Nonnull (^ _Nonnull)(NSAttributedString * _Nonnull))setAttrText{}

/*
 设置文本颜色
 */
-(LWJLabel* (^)(UIColor *color))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

-(void)setSetTextColor:(LWJLabel * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setTextColor{}

/*
 设置文本字体
 */
-(LWJLabel* (^)(UIFont *font))setFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

-(void)setSetFont:(LWJLabel * _Nonnull (^ _Nonnull)(UIFont * _Nonnull))setFont{}

/*
 设置TextAlignment
 */
-(LWJLabel* (^)(NSTextAlignment textAlignment))setTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

-(void)setSetTextAlignment:(LWJLabel * _Nonnull (^ _Nonnull)(NSTextAlignment))setTextAlignment{}

/*
设置LineBreakMode
 */
-(LWJLabel* (^)(NSLineBreakMode lineBreakMode))setLineBreakMode{
    return ^(NSLineBreakMode lineBreakMode){
        self.lineBreakMode = lineBreakMode;
        return self;
    };
}

-(void)setSetLineBreakMode:(LWJLabel * _Nonnull (^ _Nonnull)(NSLineBreakMode))setLineBreakMode{}

/*
 设置文本行数
 */
-(LWJLabel* (^)(NSInteger numberOfLines))setNumberOfLines{
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

-(void)setSetNumberOfLines:(LWJLabel * _Nonnull (^ _Nonnull)(NSInteger))setNumberOfLines{}

/*
 设置是否自适应宽度
 */
-(LWJLabel* (^)(BOOL adjustFontSizeToFitWidth))setAdjustFontSizeToFitWidth{
    return ^(BOOL adjustFontSizeToFitWidth){
        self.adjustsFontSizeToFitWidth = adjustFontSizeToFitWidth;
        return self;
    };
}

-(void)setSetAdjustFontSizeToFitWidth:(LWJLabel * _Nonnull (^ _Nonnull)(BOOL))setAdjustFontSizeToFitWidth{}

@end
