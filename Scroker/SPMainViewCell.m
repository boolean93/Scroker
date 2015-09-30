//
//  SPMainViewCell.m
//  Scroker
//
//  Created by boolean93 on 15/9/30.
//  Copyright © 2015年 boolean93. All rights reserved.
//

#import "SPMainViewCell.h"

@implementation SPMainViewCell

- (void)awakeFromNib {
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 1;
}

@end
