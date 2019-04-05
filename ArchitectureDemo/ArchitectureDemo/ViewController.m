//
//  ViewController.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "ViewController.h"
#import "MVCTableViewController.h"
#import "ThinMVCViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
#import "RACViewController.h"

@interface ViewController (){
    NSArray *_titleArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArray = @[@"传统MVC",@"MVC减重解耦",@"MVP",@"MVVM",@"RAC"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"customCell"];
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark tableViewDataSource  tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_titleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = _titleArray[indexPath.row];
    if ([@"传统MVC" isEqualToString:str]) {
        MVCTableViewController *mvc = [[MVCTableViewController alloc]init];
        mvc.title =@"传统MVC";
        [self.navigationController pushViewController:mvc animated:YES];
    }
    
    if ([@"MVC减重解耦" isEqualToString:str]) {
        ThinMVCViewController *mvc = [[ThinMVCViewController alloc]init];
        mvc.title =@"MVC减重解耦";
        [self.navigationController pushViewController:mvc animated:YES];
    }
    
    if ([@"MVP" isEqualToString:str]) {
        MVPViewController *mvc = [[MVPViewController alloc]init];
        mvc.title =@"MVP";
        [self.navigationController pushViewController:mvc animated:YES];
    }
    
    if ([@"MVVM" isEqualToString:str]) {
        MVVMViewController *mvc = [[MVVMViewController alloc]init];
        mvc.title =@"MVVM";
        [self.navigationController pushViewController:mvc animated:YES];
    }
    
    if ([@"RAC" isEqualToString:str]) {
        RACViewController *mvc = [[RACViewController alloc]init];
        mvc.title =@"RAC";
        [self.navigationController pushViewController:mvc animated:YES];
    }
    
}

@end
