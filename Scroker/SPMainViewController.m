//
//  SPMainViewController.m
//  Scroker
//
//  Created by boolean93 on 15/9/16.
//  Copyright (c) 2015年 boolean93. All rights reserved.
//

#import "SPMainViewController.h"
#import "SPMainViewCell.h"
#import "SPMainPokerView.h"
#import "SPCollectionViewLayout.h"

@interface SPMainViewController ()
@property (strong, nonatomic) SPMainPokerView *pokerView;
@end

@implementation SPMainViewController

static NSString * const reuseIdentifier = @"MyPokerCell";
static CGFloat kItemHeight = 150.f;
//static CGFloat kItemWidth = kItemHeight * 0.618;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.pokerView = [[NSBundle mainBundle] loadNibNamed:@"SPMainPokerView" owner:self options:nil][0];
    [self.view addSubview:self.pokerView];
    
    SPCollectionViewLayout *layout = (SPCollectionViewLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(kItemHeight * 0.618, kItemHeight);
    layout.headerReferenceSize = CGSizeMake(0, 30);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.class pokerNumbers].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SPMainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.number.text = [self.class pokerNumbers][indexPath.row];
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SPMainViewCell *cell = (SPMainViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    self.pokerView.frame = cell.frame;
    self.pokerView.number.text = cell.number.text;
}
/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark static things
+ (NSArray *)pokerNumbers {
    return @[@"0", @"1/2", @"1", @"2", @"3", @"5", @"8", @"13", @"20", @"40", @"100", @"∞", @"?", @"!"];
}
@end
