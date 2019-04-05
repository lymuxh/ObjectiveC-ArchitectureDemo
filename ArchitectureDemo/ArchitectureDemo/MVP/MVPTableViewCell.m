//
//  MVPTableViewCell.m
//  ArchitectureDemo
//
//  Created by xiaohui mu on 2019/4/4.
//  Copyright © 2019 xiaohui mu. All rights reserved.
//

#import "MVPTableViewCell.h"

@implementation MVPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)subButtonClick:(id)sender {
    if (self.scoreLabel.text.integerValue <= 0) return;
    self.score --;
}

- (IBAction)addButtonClick:(id)sender {
    if (self.scoreLabel.text.integerValue >= 100) return;
    self.score ++;
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
    if(_protocol && [_protocol respondsToSelector:@selector(didClickButtonWithScore:indexPath:)]){
        [_protocol didClickButtonWithScore:self.scoreLabel.text indexPath:self.indexPath];
    }
}

@end
