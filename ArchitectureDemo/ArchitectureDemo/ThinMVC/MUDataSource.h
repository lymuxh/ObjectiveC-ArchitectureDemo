//
//  MUDataSource.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DataSourceConfigBlock)(id cell,id model,NSIndexPath *indexPath);
/**
 选择block
 */
typedef void (^SelectCellBlock)(NSIndexPath *indexPath);
/**
 刷新数据
 */
typedef void  (^ReloadDataBlock)(NSMutableArray *array);

@interface MUDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
- (instancetype)initWithIdentifier:(NSString *)identifier configureBlock:(DataSourceConfigBlock)configBlock selectBlock:(SelectCellBlock)selCellBlock reloadBlock:(ReloadDataBlock)reloadBlock;
-(void)addDataArray:(NSArray *)array;
-(id)modelsAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
