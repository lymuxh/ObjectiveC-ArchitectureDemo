//
//  MVPPresent.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol MVPPresentProtocol <NSObject>

@optional
//cell-model,需要提供变更的值和对应的位置
-(void)didClickButtonWithScore:(NSString *)score indexPath:(NSIndexPath *)indexPath;
//model修改-cell引起变化
-(void)reloadUI;
@end


@interface MVPPresent : NSObject<MVPPresentProtocol>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,weak)id<MVPPresentProtocol> protocol;
@end

NS_ASSUME_NONNULL_END
