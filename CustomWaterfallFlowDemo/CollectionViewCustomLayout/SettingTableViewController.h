//
//  SettingTableViewController.h
//  CollectionViewCustomLayout
//
//  Created by Mr.LuDashi on 15/9/22.
//  Copyright (c) 2015年 ZeluLi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DoneBlock) (NSInteger cellColumn, CGFloat cellMargin, CGFloat cellMinHeight, CGFloat cellMaxHeight);

@interface SettingTableViewController : UITableViewController
@property (nonatomic) NSInteger cellColumn;
@property (nonatomic) CGFloat cellMargin;
@property (nonatomic) CGFloat cellMinHeight;
@property (nonatomic) CGFloat cellMaxHeight;

- (void) setDoneBlock: (DoneBlock) block;
@end
