//
//  RACViewController.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "RACViewController.h"
#import "RACTableViewCell.h"
#import "MVCObject.h"
#import "YYModel.h"
#import "RACViewModel.h"
#import "MUDataSource.h"

@interface RACViewController ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) RACViewModel *mv;
@property (nonatomic,strong) MUDataSource *dataSouce;
@end


@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = buttonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"RACTableViewCell" bundle:nil] forCellReuseIdentifier:@"custom"];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    //TableView精简瘦身部分
    __weak typeof(self) weakSelf = self;
    self.dataSouce = [[MUDataSource alloc] initWithIdentifier:@"custom" configureBlock:^(RACTableViewCell *cell, MVCObject *model, NSIndexPath *indexPath) {
        //对应赋值
        cell.classNameLabel.text = model.className;
        [cell setScore:model.score.intValue];
    } selectBlock:^(NSIndexPath * indexPath) {
        //界面出发
        __strong typeof(self) strongSelf = weakSelf;
        MVCObject *model = self.dataSouce.dataArray[indexPath.row];
        strongSelf.mv.contentKey = model.className;
    } reloadBlock:^(NSMutableArray * array) {
        
    }];
    self.tableView.dataSource = self.dataSouce;
    self.tableView.delegate = self.dataSouce;
    
    //MVVM部分，数据变更触发DataSource和刷新
    self.mv = [[RACViewModel alloc]init];
    [self.mv initWithBlock:^(id  _Nonnull returnValue) {
        __strong typeof(self) strongSelf = weakSelf;
        @synchronized (strongSelf) {
            [strongSelf.dataSouce addDataArray:returnValue];
            [strongSelf.tableView reloadData];
        }
    } fail:^(id  _Nonnull error) {
        
    }];
}

//界面刷新出发异步数据获取
- (void)refresh{
    //随时触发
    [self.mv loadData];
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
