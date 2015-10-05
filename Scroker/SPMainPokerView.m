//
//  SPMainPokerView.m
//  Scroker
//
//  Created by BooleanMac on 15/10/1.
//  Copyright © 2015年 boolean93. All rights reserved.
//

#import "SPMainPokerView.h"

@implementation SPMainPokerView

- (void)awakeFromNib {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2;
    self.frame = CGRectZero;
}

@end
