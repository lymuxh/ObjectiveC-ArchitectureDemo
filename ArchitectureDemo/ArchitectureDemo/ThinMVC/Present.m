//
//  Present.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "Present.h"
#import "MVCObject.h"
#import "YYModel.h"
@implementation Present

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

-(void)loadData{
    NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"},@{@"className":@"物理",@"score":@"98"},@{@"className":@"化学",@"score":@"98"}];
    
    for (int i = 0; i< [tempArray count]; i++) {
        MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
        [self.dataArray addObject:model];
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
