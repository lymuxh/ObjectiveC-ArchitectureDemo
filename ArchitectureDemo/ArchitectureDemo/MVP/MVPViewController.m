//
//  MVPViewController.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPPresent.h"
#import "MUDataSource.h"
#import "MVPTableViewCell.h"
#import "MVCObject.h"

@interface MVPViewController ()<MVPPresentProtocol>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MVPPresent *pt;
@property (nonatomic,strong) MUDataSource *dataSouce;
@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pt = [[MVPPresent alloc] init];
    //MVP 面向协议编程 代理
    __weak typeof(self) weakSelf = self;
    self.dataSouce = [[MUDataSource alloc] initWithIdentifier:@"custom" configureBlock:^(MVPTableViewCell *cell, MVCObject *model, NSIndexPath *indexPath) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        //对应赋值
        cell.classNameLabel.text = model.className;
        [cell setScore:model.score.intValue];
        cell.indexPath = indexPath;
        cell.protocol = strongSelf.pt;
        
    } selectBlock:^(NSIndexPath * indexPath) {
        
    } reloadBlock:^(NSMutableArray * array) {
        
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MVPTableViewCell" bundle:nil] forCellReuseIdentifier:@"custom"];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSouce;
    self.tableView.delegate = self.dataSouce;
    self.pt.protocol = self;
    //赋值
    [self.dataSouce addDataArray:self.pt.dataArray];
    
    /*
     VC-- 必要view引用
     建立绑定：view和model
     */
}
#pragma mark MVPPresentProtocol
-(void)reloadUI{
    [self.dataSouce addDataArray:self.pt.dataArray];
    [self.tableView reloadData];
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
