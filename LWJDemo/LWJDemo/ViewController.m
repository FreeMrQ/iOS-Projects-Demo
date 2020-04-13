//
//  ViewController.m
//  LWJDemo
//
//  Created by L.W.J on 2020/3/9.
//  Copyright © 2020 L.W.J. All rights reserved.
//

#import "ViewController.h"
#import "BlockVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *block = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    [block setTitle:@"Block" forState:UIControlStateNormal];
    [block setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [block addTarget:self
              action:@selector(clickBlock)
    forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:block];
   
    // Do any additional setup after loading the view.
}
-(void)clickBlock{
    [self presentViewController:[[BlockVC alloc] init] animated:NO completion:^{
           
       }];
}

@end
