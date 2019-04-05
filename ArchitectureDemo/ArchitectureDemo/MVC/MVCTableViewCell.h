//
//  MVCTableViewCell.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCObject.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVCTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *subtractionButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *additionButton;
@property (nonatomic,assign)int score;
@property(nonatomic,strong)MVCObject *model;
@end

NS_ASSUME_NONNULL_END
