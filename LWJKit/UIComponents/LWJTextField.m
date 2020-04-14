//
//  LWJTextField.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "LWJTextField.h"
#import <objc/runtime.h>


@implementation LWJTextField
static char ActionBeginTag;
static char ActionChangeTag;
static char ActionEndTag;
static char ActionReturnTag;
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
+(LWJTextField*)lwj_make:(void (^)(LWJTextField * _Nonnull))maker{
    LWJTextField *tf = [[LWJTextField alloc] init];
    if(maker){
        maker(tf);
    }
    return tf;
}


/*
 设置Tag
 */
-(LWJTextField* (^)(NSInteger tag))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{};

/*
设置Frame
 */
-(LWJTextField* (^)(CGRect rect))setFrame{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(void)setSetFrame:(LWJTextField * _Nonnull (^)(CGRect))setFrame{}

/*
设置背景颜色
 */
-(LWJTextField* (^)(UIColor *color))setBgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(void)setSetBgColor:(LWJTextField * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setBgColor{}



/*
 设置文本内容
 */
-(LWJTextField* (^)(NSString *content))setText{
    return ^(NSString *content){
        self.text = content;
        return self;
    };
}

-(void)setSetText:(LWJTextField * _Nonnull (^ _Nonnull)(NSString * _Nonnull))setText{}


/*
 设置特殊文本内容
 */
-(LWJTextField* (^)(NSAttributedString *content))setAttrText{
    return ^(NSAttributedString *content){
        self.attributedText = content;
        return self;
    };
}

-(void)setSetAttrText:(LWJTextField * _Nonnull (^ _Nonnull)(NSAttributedString * _Nonnull))setAttrText{}

/*
 设置文本颜色
 */
-(LWJTextField* (^)(UIColor *color))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

-(void)setSetTextColor:(LWJTextField * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setTextColor{}

/*
 设置文本字体
 */
-(LWJTextField* (^)(UIFont *font))setFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

-(void)setSetFont:(LWJTextField * _Nonnull (^ _Nonnull)(UIFont * _Nonnull))setFont{}

/*
 设置TextAlignment
 */
-(LWJTextField* (^)(NSTextAlignment textAlignment))setTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

-(void)setSetTextAlignment:(LWJTextField * _Nonnull (^ _Nonnull)(NSTextAlignment))setTextAlignment{}


/*
 设置是否自适应宽度
 */
-(LWJTextField* (^)(BOOL adjustFontSizeToFitWidth))setAdjustFontSizeToFitWidth{
    return ^(BOOL adjustFontSizeToFitWidth){
        self.adjustsFontSizeToFitWidth = adjustFontSizeToFitWidth;
        return self;
    };
}

-(void)setSetAdjustFontSizeToFitWidth:(LWJTextField * _Nonnull (^ _Nonnull)(BOOL))setAdjustFontSizeToFitWidth{}


/*
 设置默认文字
 */
-(LWJTextField* (^)(NSString *placeholder))setPlaceholder{
    return ^(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

-(void)setSetPlaceholder:(LWJTextField * _Nonnull (^ _Nonnull)(NSString * _Nonnull))setPlaceholder{}

/*
 开始编辑
 */

-(LWJTextField* (^)(TFBeginEditBlock tfBeginEdit))beginEdit{
    return ^(TFBeginEditBlock tfBeginEdit){
        objc_setAssociatedObject(self, &ActionBeginTag, tfBeginEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(didBegin) forControlEvents:UIControlEventEditingDidBegin];
        return self;
    };
}

-(void)setBeginEdit:(LWJTextField * _Nonnull (^ _Nonnull)(TFBeginEditBlock _Nonnull))beginEdit{}

- (void)didBegin{
    TFBeginEditBlock block = (TFBeginEditBlock)objc_getAssociatedObject(self, &ActionBeginTag);
    if(block){
        block(self);
    }
}


/*
 内容发生改变
 */
-(LWJTextField* (^)(TFChangeEditBlock tfChangeEdit))changeEdit{
    return ^(TFChangeEditBlock tfChangeEdit){
        objc_setAssociatedObject(self, &ActionChangeTag, tfChangeEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(didChange) forControlEvents:UIControlEventEditingChanged];
        return self;
    };
}

-(void)setChangeEdit:(LWJTextField * _Nonnull (^ _Nonnull)(TFChangeEditBlock _Nonnull))changeEdit{}

-(void)didChange{
    TFChangeEditBlock block = (TFChangeEditBlock)objc_getAssociatedObject(self, &ActionChangeTag);
    if(block){
        block(self);
    }
}


/*
 编辑结束
 */
-(LWJTextField* (^)(TFEndEditBlock tfEndEdit))endEdit{
    return ^(TFEndEditBlock tfEndEdit){
        objc_setAssociatedObject(self, &ActionEndTag, tfEndEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(didEnd) forControlEvents:UIControlEventEditingDidEnd];
        return self;
    };
}

-(void)setEndEdit:(LWJTextField * _Nonnull (^ _Nonnull)(TFEndEditBlock _Nonnull))endEdit{}

-(void)didEnd{
    TFEndEditBlock block = (TFEndEditBlock)objc_getAssociatedObject(self, &ActionEndTag);
    if(block){
        block(self);
    }
}

-(LWJTextField* (^)(TFKeyReturnBlock tfKeyReturn))keyReturn{
    return ^(TFKeyReturnBlock tfKeyReturn){
        objc_setAssociatedObject(self, &ActionReturnTag, tfKeyReturn, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(didReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
        return self;
    };
}


-(void)setKeyReturn:(LWJTextField * _Nonnull (^ _Nonnull)(TFKeyReturnBlock _Nonnull))keyReturn{}

-(void)didReturn{
    TFKeyReturnBlock block = (TFKeyReturnBlock)objc_getAssociatedObject(self, &ActionReturnTag);
    if(block){
        block(self);
    }
}


@end
