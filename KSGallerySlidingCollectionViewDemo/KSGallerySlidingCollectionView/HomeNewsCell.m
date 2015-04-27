//
//  HomeNewsCell.m
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import "HomeNewsCell.h"

const CGFloat HomeNewsCellFeatureHeight = 280;
const CGFloat HomeNewsCellCollapsedHeight = 100;

const CGFloat HomeNewsCellCollapsedImageCoverAlpha = 0.5f;
const CGFloat HomeNewsCellFeatureImageCoverAlpha = 0.2f;

@implementation HomeNewsCell

- (void)awakeFromNib {
    self.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.featureHeight = HomeNewsCellFeatureHeight;
    self.collapsedHeight = HomeNewsCellCollapsedHeight;
}


- (void)layoutSubViewsWithPercent:(CGFloat)percentOfGrowth
{
    //Curve the percent so that the animations move smoother
    percentOfGrowth = sin(percentOfGrowth * M_PI_2);
    CGFloat scaleAndAlpha = MAX(percentOfGrowth, 0.5f);
    
    self.imageCover.alpha = HomeNewsCellCollapsedImageCoverAlpha - (percentOfGrowth * (HomeNewsCellCollapsedImageCoverAlpha - HomeNewsCellFeatureImageCoverAlpha));
    self.lSubTitle.alpha = percentOfGrowth * 0.85;
    self.lTitle.layer.transform = CATransform3DMakeScale(scaleAndAlpha, scaleAndAlpha, 1);
//    self.lTitle.layer.transform = CATransform3DMakeScale(0.5+0.5*percentOfGrowth, 0.5+0.5*percentOfGrowth, 1);
    
    //You can do some constraint change if needed, cause i have no necessary to do this in this demo.

}


@end
