//
//  MUDataSource.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MUDataSource.h"
@interface MUDataSource ()

@property (nonatomic,copy) NSString *identifier;

@property (nonatomic ,copy) DataSourceConfigBlock block;

@property (nonatomic ,copy) DataSourceConfigBlock configBlock;

@property (nonatomic ,copy) SelectCellBlock selCellblock;

@property (nonatomic ,copy) ReloadDataBlock reloadBlock;

@end

@implementation MUDataSource

- (instancetype)initWithIdentifier:(NSString *)identifier configureBlock:(DataSourceConfigBlock)configBlock selectBlock:(SelectCellBlock)selCellBlock reloadBlock:(ReloadDataBlock)reloadBlock
{
    self = [super init];
    if (self) {
       _identifier = identifier ;
       _configBlock = [configBlock copy];
       _selCellblock = [selCellBlock copy];
        _reloadBlock = [reloadBlock copy];
    }
    return self;
}

-(void)addDataArray:(NSArray *)array{
    if (!array) {
        return;
    }
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
}


- (id)modelsAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray ? [self.dataArray count] : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if (self.configBlock) {
        self.configBlock(cell, model, indexPath);
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selCellblock) {
        self.selCellblock(indexPath);
    }
}


#pragma mark lazy
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


@end
