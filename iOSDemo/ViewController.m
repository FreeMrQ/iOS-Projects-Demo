//
//  ViewController.m
//  iOSDemo
//
//  Created by Ronds on 2020/4/7.
//  Copyright © 2020 lance. All rights reserved.
//

#import "ViewController.h"
#import <iOSDemo-Swift.h>
#import "BlockVC.h"
#import "RACBase.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"功能列表";
    _datas = [NSMutableArray new];
    [self initData];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    

    // Do any additional setup after loading the view.
}

-(void)initData{
    [_datas addObject:@"基于Flex布局-YogaKit库"];
    [_datas addObject:@"Block基础"];
    [_datas addObject:@"ReactiveCocoa"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell== nil){
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [_datas objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            YogaBase *yb =[[YogaBase alloc] init];
            [self.navigationController pushViewController:yb animated:YES];
            
        }
            break;
        case 1:{
            BlockVC *bvc = [[BlockVC alloc] init];
            [self.navigationController pushViewController:bvc animated:YES];
        }
            break;
        case 2:{
            RACBase *racb = [[RACBase alloc] init];
            [self.navigationController pushViewController:racb animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
