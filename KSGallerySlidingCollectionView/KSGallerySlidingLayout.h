//
//  KSGallerySlidingLayout.h
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import <UIKit/UIKit.h>


extern const CGFloat KSGallerySlidingDragInterval;

@protocol KSGallerySlidingLayoutLayoutDelegate <NSObject>

@optional
- (CGFloat)heightForFeatureCell;
- (CGFloat)heightForCollapsedCell;

@end

@interface KSGallerySlidingLayout : UICollectionViewFlowLayout


- (instancetype)initWithDelegate:(id<KSGallerySlidingLayoutLayoutDelegate>)delegate;

@property (nonatomic, assign) id <KSGallerySlidingLayoutLayoutDelegate> delegate;


@end
