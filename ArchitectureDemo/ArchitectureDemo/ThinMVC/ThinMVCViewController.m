//
//  ThinMVCViewController.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "ThinMVCViewController.h"
#import "Present.h"
#import "MUDataSource.h"
#import "MVCTableViewCell.h"

@interface ThinMVCViewController ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) Present *pt;
@property (nonatomic,strong) MUDataSource *dataSouce;
@end

@implementation ThinMVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pt = [[Present alloc] init];
    
    self.dataSouce = [[MUDataSource alloc] initWithIdentifier:@"custom" configureBlock:^(MVCTableViewCell *cell, MVCObject *model, NSIndexPath *indexPath) {
        //对应赋值
        cell.model = model;
    } selectBlock:^(NSIndexPath * indexPath) {
        
    } reloadBlock:^(NSMutableArray * array) {
        
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MVCTableViewCell" bundle:nil] forCellReuseIdentifier:@"custom"];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSouce;
    self.tableView.delegate = self.dataSouce;
    //赋值
    [self.dataSouce addDataArray:self.pt.dataArray];
    
    /*
     VC-- 必要view引用
     建立绑定：view和model
    */
}



#pragma mark -- lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end
