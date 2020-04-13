//
//  RACBase.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/13.
//  Copyright © 2020 lance. All rights reserved.
//

#import "RACBase.h"
#import <ReactiveObjC.h>
#import <Masonry.h>
@interface RACBase ()

@end

@implementation RACBase

- (void)viewDidLoad {
    [super viewDidLoad];
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
    // Do any additional setup after loading the view.
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
