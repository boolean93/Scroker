//
//  SPMainPokerView.m
//  Scroker
//
//  Created by BooleanMac on 15/10/1.
//  Copyright © 2015年 boolean93. All rights reserved.
//

#import "SPMainPokerView.h"

@implementation SPMainPokerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2;
    self.frame = CGRectZero;
}

@end
