//
//  SPMainViewCell.m
//  Scroker
//
//  Created by boolean93 on 15/9/16.
//  Copyright (c) 2015年 boolean93. All rights reserved.
//

#import "SPMainViewCell.h"

@implementation SPMainViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.cornerRadius = 1;
    self.clipsToBounds = YES;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
}

@end
