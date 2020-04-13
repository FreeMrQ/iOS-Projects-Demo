//
//  BlockVC.m
//  LWJDemo
//
//  Created by L.W.J on 2020/3/31.
//  Copyright © 2020 L.W.J. All rights reserved.
//

#import "BlockVC.h"

@interface BlockVC ()

@end

@implementation BlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.Block 是一个带有局部变量的匿名函数
    
    //2.Block 可以临时持有外部变量，这里的临时持有简单点理解就是外部变量在持有期间发生变化时，内部持有变量不会跟随一起变化，是对外部变量的一次只读拷贝，拷贝外部变量的瞬间值，生成副本
    //3.解决临时持有的问题就是对外部变量添加__block 修饰符
    int a = 10;
    __block int b = 10;
    void (^blk)(void) = ^{
        NSLog(@"a=%d,b=%d",a,b);
    };
    a = 2;
    b = 2;
    blk();
    
    //4.格式 ReturnType (^FunctionName)(ParamType ParamName) = ^ ReturnType(可以是void并省略) (ParamType ParamName--可以是void并省略){ ... }
    void (^test)(void) = ^void (void){
        NSLog(@"Test");
        
    };
    
    void (^test1)(void) = ^{
        NSLog(@"Test1");
    };
    
    test();
    test1();
    
    //5.利用typedef 简化 typedef ReturnType (^FuncName)(ParamType ParamName);
    typedef NSInteger (^handleBlock)(void);
    handleBlock block = ^NSInteger(void){
        return 1;
    };
    block();
    
    
    //5.Block 递归
     
     int (^sum)(int value) = [^int (int i){
         
        if(i>10){
            return i;
        }
        i++;
        return sum(i);
    } copy];
    int d = sum(1);
    
    //6.bolck 不一定会造成循环引用，判断的依据是相互之间是否持有强引用，比如block用到了self，block就会持有self的引用，但是self没有直接或间接持有block，所以不会造成循环引用
    @weakify(self);
    _imageClickBlock = ^void(NSInteger index){
        @strongify(self);
        [self.view addSubview:[UIButton new]];
    };
    
    
    
    
    
}

-(void)defTest:(ClickBlock)block{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
