//
//  KSGallerySlidingCell.h
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 The height of a KSGallerySlidingCell when it is at it's full feature height.
 */
extern const CGFloat KSGallerySlidingCellFeatureHeight;

/**
 The height of a KSGallerySlidingCell when it is at it's normal height.
 */
extern const CGFloat KSGallerySlidingCellCollapsedHeight;



@interface KSGallerySlidingCell : UICollectionViewCell

@property (nonatomic) CGFloat featureHeight;
@property (nonatomic) CGFloat collapsedHeight;

@end
