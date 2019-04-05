//
//  RACTableViewCell.h
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/5.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *subtractionButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UIButton *additionButton;
@property (nonatomic,assign)int score;
@end

NS_ASSUME_NONNULL_END
