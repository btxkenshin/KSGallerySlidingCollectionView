//
//  HomeNewsCell.h
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSGallerySlidingCell.h"


extern const CGFloat HomeNewsCellFeatureHeight;
extern const CGFloat HomeNewsCellCollapsedHeight;

@interface HomeNewsCell : KSGallerySlidingCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *imageCover;

@property (weak, nonatomic) IBOutlet UILabel *lTitle;
@property (weak, nonatomic) IBOutlet UILabel *lSubTitle;


@end
