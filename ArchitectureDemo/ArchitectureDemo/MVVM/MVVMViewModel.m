//
//  MVVMViewModel.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MVVMViewModel.h"
#import "MVCObject.h"
#import "YYModel.h"
#import <SVProgressHUD.h>

@interface MVVMViewModel ()
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation MVVMViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"contentKey" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)loadData{
    
    [SVProgressHUD showWithStatus:@"开始加载"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       [SVProgressHUD showWithStatus:@"加载。。。"];
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
                [SVProgressHUD showSuccessWithStatus:@"加载完成"];
                [SVProgressHUD dismissWithCompletion:^{
                    self.successBlock(self.dataArray);
                }];
            }
        });
    });
    
}

#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change[NSKeyValueChangeNewKey]);
    
    NSArray *tempArray =@[@{@"className":@"语文",@"score":@"98"},@{@"className":@"数学",@"score":@"98"},@{@"className":@"英语",@"score":@"98"},@{@"className":@"物理",@"score":@"98"},@{@"className":@"化学",@"score":@"98"}];
    
    @synchronized (self) {
        [self.dataArray removeAllObjects];
        for (int i = 0; i< [tempArray count]; i++) {
            MVCObject *model = [MVCObject yy_modelWithDictionary:tempArray[i]];
            if ([model.className isEqualToString:change[NSKeyValueChangeNewKey]]) {
                continue;
            }
            [self.dataArray addObject:model];
        }
    }
    
    if(self.successBlock){
        self.successBlock(self.dataArray);
    }
    
}


#pragma mark lazy
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentKey"];
}
@end
