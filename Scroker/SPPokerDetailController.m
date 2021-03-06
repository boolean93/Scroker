//
//  SPPokerDetailController.m
//  Scroker
//
//  Created by boolean93 on 15/10/5.
//  Copyright © 2015年 boolean93. All rights reserved.
//

#import "SPPokerDetailController.h"

@interface SPPokerDetailController ()

@end

@implementation SPPokerDetailController
-(instancetype)init {
    self = [super init];
    if (self) {
        self.numberLabel.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    self.numberLabel.text = self.pokerNumber;
    self.numberLabel.adjustsFontSizeToFitWidth = YES;
    CALayer *borderLayer = [[CALayer alloc]init];
    CGRect frame = self.view.frame;
    CGFloat delta = 20;
    frame.origin.x += delta;
    frame.origin.y -= 5;
    frame.size.width -= delta * 2;
    frame.size.height += 5 * 2;
    borderLayer.frame = frame;
    borderLayer.borderWidth = 5;
    borderLayer.borderColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:borderLayer];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
