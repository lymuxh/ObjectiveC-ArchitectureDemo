//
//  BaseViewModel.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
- (instancetype)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock
{
    self = [super init];
    if (self) {
        _successBlock = [successBlock copy];
        _failBlock = [failBlock copy];
    }
    return self;
}


@end
