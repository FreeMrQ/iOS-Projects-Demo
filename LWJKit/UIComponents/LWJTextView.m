//
//  LWJTextView.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "LWJTextView.h"
#import <objc/runtime.h>
@implementation LWJTextView

static char ActionBeginTag;
static char ActionChangeTag;
static char ActionEndTag;
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
+(LWJTextView*)lwj_make:(void (^)(LWJTextView * _Nonnull))maker{
    LWJTextView *tv = [[LWJTextView alloc] init];
    if(maker){
        maker(tv);
    }
    return tv;
}


/*
 设置Tag
 */
-(LWJTextView* (^)(NSInteger tag))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

-(void)setSetTag:(UIView * _Nonnull (^)(NSInteger))setTag{};

/*
设置Frame
 */
-(LWJTextView* (^)(CGRect rect))setFrame{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

-(void)setSetFrame:(LWJTextView * _Nonnull (^)(CGRect))setFrame{}

/*
设置背景颜色
 */
-(LWJTextView* (^)(UIColor *color))setBgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(void)setSetBgColor:(LWJTextView * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setBgColor{}



/*
 设置文本内容
 */
-(LWJTextView* (^)(NSString *content))setText{
    return ^(NSString *content){
        self.text = content;
        return self;
    };
}

-(void)setSetText:(LWJTextView * _Nonnull (^ _Nonnull)(NSString * _Nonnull))setText{}


/*
 设置特殊文本内容
 */
-(LWJTextView* (^)(NSAttributedString *content))setAttrText{
    return ^(NSAttributedString *content){
        self.attributedText = content;
        return self;
    };
}

-(void)setSetAttrText:(LWJTextView * _Nonnull (^ _Nonnull)(NSAttributedString * _Nonnull))setAttrText{}

/*
 设置文本颜色
 */
-(LWJTextView* (^)(UIColor *color))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

-(void)setSetTextColor:(LWJTextView * _Nonnull (^ _Nonnull)(UIColor * _Nonnull))setTextColor{}

/*
 设置文本字体
 */
-(LWJTextView* (^)(UIFont *font))setFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

-(void)setSetFont:(LWJTextView * _Nonnull (^ _Nonnull)(UIFont * _Nonnull))setFont{}

/*
 设置TextAlignment
 */
-(LWJTextView* (^)(NSTextAlignment textAlignment))setTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

-(void)setSetTextAlignment:(LWJTextView * _Nonnull (^ _Nonnull)(NSTextAlignment))setTextAlignment{}


/*
 开始编辑
 */


-(LWJTextView* (^)(TVBeginEditBlock tvBeginEdit))beginEdit{
    return ^(TVBeginEditBlock tvBeginEdit){
        objc_setAssociatedObject(self, &ActionBeginTag, tvBeginEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didBegin)
                                                     name:UITextViewTextDidBeginEditingNotification
                                                   object:self];
        return self;
    };
}


-(void)setBeginEdit:(LWJTextView * _Nonnull (^ _Nonnull)(TVBeginEditBlock _Nonnull))beginEdit{}

- (void)didBegin{
    TVBeginEditBlock block = (TVBeginEditBlock)objc_getAssociatedObject(self, &ActionBeginTag);
    if(block){
        block(self);
    }
}


/*
 内容发生改变
 */
-(LWJTextView* (^)(TVChangeEditBlock tvChangeEdit))changeEdit{
    return ^(TVChangeEditBlock tvChangeEdit){
        objc_setAssociatedObject(self, &ActionChangeTag, tvChangeEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(didChange)
            name:UITextViewTextDidChangeNotification
          object:self];
        return self;
    };
}

-(void)setChangeEdit:(LWJTextView * _Nonnull (^ _Nonnull)(TVChangeEditBlock _Nonnull))changeEdit{}

-(void)didChange{
    TVChangeEditBlock block = (TVChangeEditBlock)objc_getAssociatedObject(self, &ActionChangeTag);
    if(block){
        block(self);
    }
}


/*
 编辑结束
 */
-(LWJTextView* (^)(TVEndEditBlock tfEndEdit))endEdit{
    return ^(TVEndEditBlock tvEndEdit){
        objc_setAssociatedObject(self, &ActionEndTag, tvEndEdit, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self
               selector:@selector(didEnd)
                   name:UITextViewTextDidEndEditingNotification
                 object:self];
        return self;
    };
}

-(void)setEndEdit:(LWJTextView * _Nonnull (^ _Nonnull)(TVEndEditBlock _Nonnull))endEdit{}

-(void)didEnd{
    TVEndEditBlock block = (TVEndEditBlock)objc_getAssociatedObject(self, &ActionEndTag);
    if(block){
        block(self);
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
