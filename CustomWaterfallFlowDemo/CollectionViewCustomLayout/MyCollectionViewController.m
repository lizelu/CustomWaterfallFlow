//
//  MyCollectionViewController.m
//  CollectionViewCustomLayout
//
//  Created by Mr.LuDashi on 15/9/15.
//  Copyright (c) 2015年 ZeluLi. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "CustomeCollectionViewLayout.h"
#import "SettingTableViewController.h"

@interface MyCollectionViewController () <CustomeCollectionViewLayoutDelegate>
@property (strong, nonatomic) CustomeCollectionViewLayout *customeLayout;

@property (nonatomic) NSInteger cellColumn;
@property (nonatomic) CGFloat cellMargin;
@property (nonatomic) CGFloat cellMinHeight;
@property (nonatomic) CGFloat cellMaxHeight;
@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _customeLayout = (CustomeCollectionViewLayout *) self.collectionViewLayout;
    
    _customeLayout.layoutDelegate = self;
    
    _cellColumn = 3;
    _cellMargin = 2;
    _cellMinHeight = 50;
    _cellMaxHeight = 200;
}

- (IBAction)tapSettingButton:(id)sender {
    SettingTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main"
                                                                bundle:[NSBundle mainBundle]]
                                      instantiateViewControllerWithIdentifier:@"SettingTableViewController"];
    vc.cellColumn = _cellColumn;
    vc.cellMargin = _cellMargin;
    vc.cellMinHeight = _cellMinHeight;
    vc.cellMaxHeight = _cellMaxHeight;
    
    [vc setDoneBlock:^(NSInteger cellColumn, CGFloat cellMargin, CGFloat cellMinHeight, CGFloat cellMaxHeight) {
        
        _cellColumn = cellColumn;
        _cellMargin = cellMargin;
        _cellMinHeight = cellMinHeight;
        _cellMaxHeight = cellMaxHeight;
        
        [self.collectionView reloadData];
    }];
    
    [self.navigationController showViewController:vc sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSInteger imageIndex = arc4random()%10;
    
    NSString *imageName = [NSString stringWithFormat:@"00%ld.jpg", imageIndex];
    
    [cell.cellImageView setImage:[UIImage imageNamed:imageName]];
    
    // Configure the cell
    
    return cell;
}


#pragma mark <CustomeCollectionViewLayoutDelegate>
- (NSInteger) numberOfColumnWithCollectionView: (UICollectionView *)collectionView
                          collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellColumn;
}

- (CGFloat)marginOfCellWithCollectionView:(UICollectionView *)collectionView collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMargin;
}

- (CGFloat)minHeightOfCellWithCollectionView:(UICollectionView *)collectionView collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMinHeight;
}

- (CGFloat)maxHeightOfCellWithCollectionView:(UICollectionView *)collectionView collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMaxHeight;
}

#pragma mark <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        offsetY = 0;
    }
    
    self.navigationController.navigationBar.alpha = (300 - offsetY)/300;
    
    
}

@end
