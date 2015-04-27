# KSGallerySlidingCollectionView
`KSGallerySlidingCollectionView` is a collection view menu in the style of UltraVisual.

![image](https://github.com/btxkenshin/Resource/blob/master/KSGallerySlidingCollectionViewDemo2.gif?raw=true)

Reference from [RPSlidingMenu](https://github.com/RobotsAndPencils/RPSlidingMenu).But we make some improve Which makes it a highly-customizable lightweight component.

# Description

1. CollectionViewLayout subclass from FlowLayout directly.
2. Better performance:we do not caculate layoutattributes of all Items.we only recaculate layoutattributes of rect that needed to display.
3. Highly-customizable and lightweight.

# Demo

see `KSGallerySlidingCollectionViewDemo`

# Installation

# From CocoaPods

Add `pod 'KSGallerySlidingCollectionView'` to your Podfile

# Usage

(see sample Xcode project in /KSGallerySlidingCollectionViewDemo)

1. Create a new file that inherits from `KSGallerySlidingCell`.
overload the following method: 

		- (void)layoutSubViewsWithPercent:(CGFloat)percentOfGrowth
You should do all the position and alpha change dule to the percentOfGrowth

2. In the ViewController,setup the CollectionView:

		KSGallerySlidingLayout *layout = [[KSGallerySlidingLayout alloc] initWithDelegate:self];
		layout.itemSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), HomeNewsCellCollapsedHeight);
		self.collectionView.collectionViewLayout = layout;
		[self.collectionView registerNib:[UINib nibWithNibName:@"HomeNewsCell" bundle:nil] forCellWithReuseIdentifier:@"HomeNewsCell"];



# Advance Customization

1. You can customize the featureHeight and collapsedHeight.  
set the height after cell intilized:
	
		self.featureHeight = HomeNewsCellFeatureHeight;
		self.collapsedHeight = HomeNewsCellCollapsedHeight;
implement the KSGallerySlidingLayoutLayoutDelegate in the ViewController:

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
2. Customize the cell animation when view scroll
all you need to do is overload the following method in you cell,and do all the position and alpha change dule to the percentOfGrowth:

		- (void)layoutSubViewsWithPercent:(CGFloat)percentOfGrowth



# Notes

If you have any suggestions feel free to contact me.




