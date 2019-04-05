//
//  MVPPresent.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MVPPresent.h"
#import "MVCObject.h"
#import "YYModel.h"

@implementation MVPPresent
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


#pragma mark MVPPresentProtocol
//cell-model,需要提供变更的值和对应的位置
-(void)didClickButtonWithScore:(NSString *)score indexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < [_dataArray count]) {
        //多线程护航
        @synchronized (self) {
            MVCObject *mvc = _dataArray[indexPath.row];
            mvc.score = score;
        }
    }
    
    if([score intValue] < 95){
        //新数据变化
        NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"}];
        
        @synchronized (self) {
            [self.dataArray removeAllObjects];
            for (int i = 0; i< [tempArray count]; i++) {
                MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
                [self.dataArray addObject:model];
            }
        }
        
        if (_protocol && [_protocol respondsToSelector: @selector(reloadUI)]) {
            [_protocol reloadUI];
        }
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
