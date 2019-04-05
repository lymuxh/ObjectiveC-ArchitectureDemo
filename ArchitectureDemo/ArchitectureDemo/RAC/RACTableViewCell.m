//
//  RACTableViewCell.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/5.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "RACTableViewCell.h"
#import <ReactiveObjC.h>
@implementation RACTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[self.subtractionButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        if (self.scoreLabel.text.integerValue <= 0) return;
        self.score --;
    }];
    
    [[self.additionButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.scoreLabel.text.integerValue >= 100) return;
        self.score ++;
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


#pragma mark -setter
- (void)setScore:(int)score{
    _score = score;
    //修改界面上的显示
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
}
@end
