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
    self.wrapperView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.wrapperView.layer.borderWidth = 2;
}

@end
