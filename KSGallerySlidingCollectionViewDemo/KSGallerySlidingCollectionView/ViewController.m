//
//  ViewController.m
//  KSGallerySlidingCollectionView
//
//  Created by btxkenshin on 4/27/15.
//  Copyright (c) 2015 btxkenshin. All rights reserved.
//

#import "ViewController.h"

#import "KSGallerySlidingLayout.h"
#import "HomeNewsCell.h"


@interface ViewController ()<KSGallerySlidingLayoutLayoutDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KSGallerySlidingLayout *layout = [[KSGallerySlidingLayout alloc] initWithDelegate:self];
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), HomeNewsCellCollapsedHeight);
    
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeNewsCell" bundle:nil] forCellWithReuseIdentifier:@"HomeNewsCell"];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeNewsCell" forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.lTitle.text = @"Walking Away";
        cell.lSubTitle.text = @"Do not go gentle into that good night";
        cell.imageView.image = [UIImage imageNamed:@"1"];
    }else{
        cell.lTitle.text = @"Say Something";
        cell.lSubTitle.text = @"Old age should burn and rave at close of day";
        cell.imageView.image = [UIImage imageNamed:@"2"];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - KSGallerySlidingLayoutLayoutDelegate

- (CGFloat)heightForFeatureCell
{
    //    return RPSlidingCellFeatureHeight;
    return HomeNewsCellFeatureHeight;
}

- (CGFloat)heightForCollapsedCell
{
    //    return RPSlidingCellCollapsedHeight;
    return HomeNewsCellCollapsedHeight;
}

@end
