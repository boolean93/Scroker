//
//  SPMainViewController.m
//  Scroker
//
//  Created by boolean93 on 15/9/16.
//  Copyright (c) 2015年 boolean93. All rights reserved.
//

#import "SPMainViewController.h"
#import "SPMainViewCell.h"
#import "SPCollectionViewLayout.h"
#import "SPPokerDetailController.h"

@interface SPMainViewController ()
@property (assign, nonatomic) NSString *pokerNumber;
@end

@implementation SPMainViewController

static NSString * const reuseIdentifier = @"MyPokerCell";
static CGFloat kItemHeight = 150.f;
//static CGFloat kItemWidth = kItemHeight * 0.618;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    SPCollectionViewLayout *layout = (SPCollectionViewLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(kItemHeight * 0.618, kItemHeight);
    layout.headerReferenceSize = CGSizeMake(0, 30);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((SPPokerDetailController *)[segue destinationViewController]).pokerNumber = self.pokerNumber;
}


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
    SPMainViewCell *cell = (SPMainViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    self.pokerNumber = cell.number.text;
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
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

#pragma mark - peek and pop

// for peek
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
    if (!indexPath) {
        return nil;
    }
    SPMainViewCell *cell = (SPMainViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    previewingContext.sourceRect = cell.frame;
    SPPokerDetailController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"SPPokerDetailController"];
    detailController.pokerNumber = cell.number.text;
    detailController.preferredContentSize = CGSizeMake(0.0, 400);
    NSLog(@"peek action");
    return detailController;
}

// for pop
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
    NSLog(@"%@ pop action", previewingContext);
}

@end
