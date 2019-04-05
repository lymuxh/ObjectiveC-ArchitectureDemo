//
//  BaseViewModel.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SuccessBlock)(id returnValue);
typedef void(^FailBlock)(id error);

@interface BaseViewModel : NSObject
@property (nonatomic ,copy) SuccessBlock successBlock;
@property (nonatomic ,copy) FailBlock failBlock;
- (instancetype)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock;
@end

NS_ASSUME_NONNULL_END
