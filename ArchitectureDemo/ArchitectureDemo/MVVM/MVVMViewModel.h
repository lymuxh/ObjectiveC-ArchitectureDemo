//
//  MVVMViewModel.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVMViewModel : BaseViewModel
//界面变更出发消息，修改数据
@property (nonatomic,copy) NSString *contentKey;
//数据变化引起页面刷新
-(void)loadData;
@end

NS_ASSUME_NONNULL_END
