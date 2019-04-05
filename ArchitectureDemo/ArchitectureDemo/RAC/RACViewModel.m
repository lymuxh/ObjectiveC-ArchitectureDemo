//
//  RACViewModel.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/5.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "RACViewModel.h"
#import "MVCObject.h"
#import "YYModel.h"
#import <ReactiveObjC.h>

@interface RACViewModel ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation RACViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [RACObserve(self, contentKey) subscribeNext:^(id  _Nullable x) {
            NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"},@{@"className":@"物理",@"score":@"98"},@{@"className":@"化学",@"score":@"98"}];
            
            @synchronized (self) {
                [self.dataArray removeAllObjects];
                for (int i = 0; i< [tempArray count]; i++) {
                    MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
                    if ([model.className isEqualToString:x]) {
                        continue;
                    }
                    [self.dataArray addObject:model];
                }
            }
            
            if(self.successBlock){
                self.successBlock(self.dataArray);
            }
        }];
    }
    return self;
}

-(void)loadData{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:1];
        
        NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"},@{@"className":@"物理",@"score":@"98"},@{@"className":@"化学",@"score":@"98"}];
        @synchronized (self) {
            [self.dataArray removeAllObjects];
            for (int i = 0; i< [tempArray count]; i++) {
                MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
                [self.dataArray addObject:model];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(self.successBlock){
                self.successBlock(self.dataArray);
            }
        });
    });
}

#pragma mark lazy
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
