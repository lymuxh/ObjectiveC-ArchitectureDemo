//
//  MVCTableViewController.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MVCTableViewController.h"
#import "MVCTableViewCell.h"
#import "MVCObject.h"
#import "YYModel.h"

@interface MVCTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation MVCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MVCTableViewCell" bundle:nil] forCellReuseIdentifier:@"custom"];
}

-(void)loadData{
    NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"},@{@"className":@"物理",@"score":@"98"},@{@"className":@"化学",@"score":@"98"}];
    for (int i = 0; i< [tempArray count]; i++) {
        MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
        [self.dataArray addObject:model];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custom" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -- lazy

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

@end
