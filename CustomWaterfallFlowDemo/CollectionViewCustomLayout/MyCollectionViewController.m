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

#define CELL_COLUMN 3
#define CELL_MARGIN 2
#define CELL_MIN_HEIGHT 50
#define CELL_MAX_HEIGHT 200
#define SECTIONS_COUNT 1
#define CELL_COUNT 1000
#define SCROLL_OFFSET_Y 300

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
    
    [self initData];
}

#pragma mark - 自定义方法
- (void)initData {
    _cellColumn = CELL_COLUMN;
    _cellMargin = CELL_MARGIN;
    _cellMinHeight = CELL_MIN_HEIGHT;
    _cellMaxHeight = CELL_MAX_HEIGHT;
}


#pragma mark - 控件事件处理
- (IBAction)tapSettingButton:(id)sender {
    SettingTableViewController *vc = [[UIStoryboard storyboardWithName:@"Main"
                                                                bundle:[NSBundle mainBundle]]
                                      instantiateViewControllerWithIdentifier:@"SettingTableViewController"];
    
    vc.cellColumn    = _cellColumn;
    vc.cellMargin    = _cellMargin;
    vc.cellMinHeight = _cellMinHeight;
    vc.cellMaxHeight = _cellMaxHeight;
    
    [vc setDoneBlock:^(NSInteger cellColumn, CGFloat cellMargin, CGFloat cellMinHeight, CGFloat cellMaxHeight) {
        
        _cellColumn    = cellColumn;
        _cellMargin    = cellMargin;
        _cellMinHeight = cellMinHeight;
        _cellMaxHeight = cellMaxHeight;
        
        [self.collectionView reloadData];
    }];
    
    [self.navigationController showViewController:vc sender:nil];
}




#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return SECTIONS_COUNT;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return CELL_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                              forIndexPath:indexPath];
    
    NSInteger imageIndex = arc4random()%10;
    
    NSString *imageName = [NSString stringWithFormat:@"00%ld.jpg", imageIndex];
    [cell.cellImageView setImage:[UIImage imageNamed:imageName]];
    
    return cell;
}


#pragma mark - <CustomeCollectionViewLayoutDelegate>
- (NSInteger) numberOfColumnWithCollectionView:(UICollectionView *)collectionView
                          collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellColumn;
}

- (CGFloat)marginOfCellWithCollectionView:(UICollectionView *)collectionView
                     collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMargin;
}

- (CGFloat)minHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMinHeight;
}

- (CGFloat)maxHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return _cellMaxHeight;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < 0) {
        offsetY = 0;
    }
    
    self.navigationController.navigationBar.alpha = (SCROLL_OFFSET_Y - offsetY) / SCROLL_OFFSET_Y;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
