//
//  KSGallerySlidingLayout.m
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import "KSGallerySlidingLayout.h"
#import "KSGallerySlidingCell.h"

const CGFloat KSGallerySlidingDragInterval = 180.0f;

@implementation KSGallerySlidingLayout

- (instancetype)initWithDelegate:(id<KSGallerySlidingLayoutLayoutDelegate>)delegate {
    
    self = [super init];
    if (self){
        _delegate = delegate;
        
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
    }
    
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
}

- (CGFloat)currentCellIndex {
    return (self.collectionView.contentOffset.y / KSGallerySlidingDragInterval);
}

- (CGFloat)featureHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForFeatureCell)]){
        return [self.delegate heightForFeatureCell];
    }else{
        return KSGallerySlidingCellFeatureHeight;
    }
}

- (CGFloat)collapsedHeight{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(heightForCollapsedCell)]){
        return [self.delegate heightForCollapsedCell];
    }else{
        return KSGallerySlidingCellCollapsedHeight;
    }
}


-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    return attr;
}

- (CGSize)collectionViewContentSize {
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat height = (numberOfItems * KSGallerySlidingDragInterval) + (self.collectionView.frame.size.height - KSGallerySlidingDragInterval);
    return CGSizeMake(self.collectionView.frame.size.width, height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSInteger topFeatureIndex = [self currentCellIndex];
    
    CGRect correctRect;
    if(topFeatureIndex == 0){ //因为导航栏和当前CELL的高度特殊，所有做特殊处理
        correctRect = CGRectMake(0, 0, CGRectGetWidth(rect), CGRectGetHeight(rect));
    }else{
        correctRect = CGRectMake(0, [self collapsedHeight]*(topFeatureIndex), CGRectGetWidth(rect), CGRectGetHeight(rect));
    }
    NSArray* attributesInRect = [super layoutAttributesForElementsInRect:correctRect];
    
    
    CGFloat topCellsInterpolation =  [self currentCellIndex] - topFeatureIndex;
    
    // last rect will be used to calculate frames past the first one.  We initialize it to a non junk 0 value
    __block CGRect lastRect = CGRectMake(0.0f, 0.0f, CGRectGetWidth(rect), [self collapsedHeight]);
    NSInteger numItems = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat featureHeight = [self featureHeight];
    CGFloat normalHeight = [self collapsedHeight];
    
    
    [attributesInRect enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UICollectionViewLayoutAttributes *attributes = (UICollectionViewLayoutAttributes *)obj;
        NSIndexPath *indexPath = [attributes indexPath];
        attributes.zIndex = indexPath.row;
        NSInteger yValue = 0.0f;
        
        if (indexPath.row == topFeatureIndex) {
            // our top feature cell
            CGFloat yOffset = normalHeight  *topCellsInterpolation;
            yValue = self.collectionView.contentOffset.y - yOffset;
            attributes.frame = CGRectMake(0.0f, yValue , CGRectGetWidth(rect), featureHeight);
        } else if (indexPath.row == (topFeatureIndex + 1) && indexPath.row != numItems) {
            // the cell after the feature which grows into one as it goes up unless its the last cell (back to top)
            yValue = lastRect.origin.y + lastRect.size.height;
            CGFloat bottomYValue = yValue + normalHeight;
            CGFloat amountToGrow = MAX((featureHeight - normalHeight) *topCellsInterpolation, 0);
            NSInteger newHeight = normalHeight + amountToGrow;
            attributes.frame = CGRectMake(0.0f, bottomYValue - newHeight, CGRectGetWidth(rect), newHeight);
        } else {
            // all other cells above or below those on screen
            yValue = lastRect.origin.y + lastRect.size.height;
            attributes.frame = CGRectMake(0.0f, yValue, CGRectGetWidth(rect), normalHeight);
        }
        
        lastRect = attributes.frame;
        
    }];
    
//    NSLog(@"%@",attributesInRect);
    
    return attributesInRect;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat proposedPageIndex = roundf(proposedContentOffset.y / KSGallerySlidingDragInterval);
    CGFloat nearestPageOffset = proposedPageIndex * KSGallerySlidingDragInterval;
    
    self.collectionView.decelerationRate = .8;
    return CGPointMake(0.0f, nearestPageOffset);
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return self.layoutAttributes[indexPath];
//}

// bounds change causes prepareLayout if YES
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
