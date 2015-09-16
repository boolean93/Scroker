//
//  SPCollectionViewLayout.m
//  Scroker
//
//  Created by boolean93 on 15/9/16.
//  Copyright (c) 2015年 boolean93. All rights reserved.
//

#import "SPCollectionViewLayout.h"

@implementation SPCollectionViewLayout
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    return attributes;
}
@end
