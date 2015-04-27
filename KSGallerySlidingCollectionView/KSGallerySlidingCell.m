//
//  KSGallerySlidingCell.m
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) btxkenshin. All rights reserved.
//

#import "KSGallerySlidingCell.h"


const CGFloat KSGallerySlidingCellFeatureHeight = 240.0f;
const CGFloat KSGallerySlidingCellCollapsedHeight = 88.0f;

@interface KSGallerySlidingCell ()

@property (strong, nonatomic) UIView *imageCover;

@end

@implementation KSGallerySlidingCell


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (CGFloat)featureHeight
{
    if (_featureHeight > 0) {
        return _featureHeight;
    }else{
        return KSGallerySlidingCellFeatureHeight;
    }
}

- (CGFloat)collapsedHeight
{
    if (_collapsedHeight > 0) {
        return _collapsedHeight;
    }else{
        return KSGallerySlidingCellCollapsedHeight;
    }
}

#pragma - mark subview setup

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    [super applyLayoutAttributes:layoutAttributes];
//    NSLog(@"applyLayoutAttributes:%ld",(long)layoutAttributes.indexPath.row);
    
    CGFloat featureNormaHeightDifference = self.featureHeight - self.collapsedHeight;
    
    // how much its grown from normal to feature
    CGFloat amountGrown = self.featureHeight - self.frame.size.height;
    
    // percent of growth from normal to feature
    CGFloat percent = 1 - (amountGrown / featureNormaHeightDifference);
    
    [self layoutSubViewsWithPercent:percent];

}

- (void)layoutSubViewsWithPercent:(CGFloat)percentOfGrowth
{
    NSAssert(NO, @"This method must be overriden in the subclass");
}

@end
