//
//  ViewController.m
//  LWJDemo
//
//  Created by L.W.J on 2020/3/9.
//  Copyright © 2020 L.W.J. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "BlockVC.h"
=======
#import <ReactiveObjC.h>
#import <Masonry.h>
>>>>>>> feature/RAC_Demo
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    UIButton *block = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    [block setTitle:@"Block" forState:UIControlStateNormal];
    [block setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [block addTarget:self
              action:@selector(clickBlock)
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:block];
   
=======
//    NSArray *ary =@[@1,@2,@3];
//    RACSequence *stream = [ary rac_sequence];
//    [stream map:^id _Nullable(id  _Nullable value) {
//        return @(pow([value integerValue], 2));
//    }];
//
//    ary = [stream array];
//
//    [[[ary rac_sequence] filter:^BOOL(id  _Nullable value) {
//        return [value integerValue]%2==0;
//    }]array];
    
//    [[[ary rac_sequence] map:^id _Nullable(id  _Nullable value) {
//        return [value stringValue];
//    }] foldLeftWithStart:@"" reduce:^id _Nullable(id  _Nullable accumulator, id  _Nullable value) {
//        return [accumulator stringByAppendingString:value];
//    }];
//
    
    UITextField *tf = ({
        UITextField *item = [[UITextField alloc] init];
        [self.view addSubview:item];
        item;
    });
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    
    
    UIButton *btn = ({
        UIButton *item = [UIButton new];
        [self.view addSubview:item];
        item;
    });
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(tf.mas_bottom).with.offset(20);
        make.height.equalTo(@50);
    }];
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    [tf.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"New Input:%@",x);
    }
                               error:^(NSError * _Nullable error) {
        NSLog(@"Error:%@",error);
    }
                           completed:^{
        NSLog(@"Completed");
    }];
    
    RACSignal *validEmailSignal =[tf.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @([value rangeOfString:@"@"].location !=NSNotFound);
    }];
//    RAC(btn,enabled) = validEmailSignal;
//    RAC(tf,textColor) = [validEmailSignal map:^id _Nullable(id  _Nullable value) {
//        if([value boolValue]){
//            return [UIColor blueColor];
//        }else{
//            return [UIColor redColor];
//        }
//    }];
    
    btn.rac_command = [[RACCommand alloc] initWithEnabled:validEmailSignal
                                              signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"button pressed");
        return [RACSignal empty];
    }];
    
   // @weakify()
    
    
    
>>>>>>> feature/RAC_Demo
    // Do any additional setup after loading the view.
}
-(void)clickBlock{
    [self presentViewController:[[BlockVC alloc] init] animated:NO completion:^{
           
       }];
}

@end
