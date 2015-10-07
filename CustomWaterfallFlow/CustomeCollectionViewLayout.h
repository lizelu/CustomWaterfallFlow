//
//  CustomeCollectionViewLayout.h
//  CollectionViewCustomLayout
//
//  Created by Mr.LuDashi on 15/9/15.
//  Copyright (c) 2015年 ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomeCollectionViewLayout;

@protocol CustomeCollectionViewLayoutDelegate <NSObject>
/**
 * 确定布局行数的回调
 */
@required
- (NSInteger)numberOfColumnWithCollectionView:(UICollectionView *)collectionView
                          collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout;

/**
 * 确定cell的Margin
 */
@required
- (CGFloat)marginOfCellWithCollectionView:(UICollectionView *)collectionView
                     collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout;
/**
 * 确定cell的最小高度
 */
@required
- (CGFloat)minHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout;

/**
 * 确定cell的最大高度
 */
@required
- (CGFloat)maxHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout;

@end


@interface CustomeCollectionViewLayout : UICollectionViewLayout

@property (weak, nonatomic) id<CustomeCollectionViewLayoutDelegate> layoutDelegate;

@end

