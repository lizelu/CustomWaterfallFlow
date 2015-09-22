//
//  SettingTableViewController.m
//  CollectionViewCustomLayout
//
//  Created by Mr.LuDashi on 15/9/22.
//  Copyright (c) 2015年 ZeluLi. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()
@property (strong, nonatomic) IBOutlet UITextField *columnTextField;
@property (strong, nonatomic) IBOutlet UITextField *cellMarginTextField;
@property (strong, nonatomic) IBOutlet UITextField *cellMinHeightTextField;
@property (strong, nonatomic) IBOutlet UITextField *cellMaxHeightTextField;

@property (strong, nonatomic) DoneBlock block;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self initFormData];
}

-(void) initFormData{
    _columnTextField.text = [NSString stringWithFormat:@"%ld", _cellColumn];
    _cellMarginTextField.text = [NSString stringWithFormat:@"%.0lf", _cellMargin];
    _cellMinHeightTextField.text = [NSString stringWithFormat:@"%.0lf", _cellMinHeight];
    _cellMaxHeightTextField.text = [NSString stringWithFormat:@"%.0lf", _cellMaxHeight];
}

- (void) setDoneBlock: (DoneBlock) block{
    _block = block;
}


- (IBAction)tapDone:(id)sender {
    if (_block) {
        if ([_columnTextField.text isEqualToString:@""]) {
            [self alterWithString:@"Column不能为空"];
            return;
        }
        if ([_cellMarginTextField.text isEqualToString:@""]) {
            [self alterWithString:@"Margin不能为空"];
            return;
        }
        if ([_cellMinHeightTextField.text isEqualToString:@""]) {
            [self alterWithString:@"Cell Min Height不能为空"];
            return;
        }
        if ([_cellMaxHeightTextField.text isEqualToString:@""]) {
            [self alterWithString:@"Cell Max Height不能为空"];
            return;
        }
        
        _cellColumn = _columnTextField.text.integerValue;
        _cellMargin = _cellMarginTextField.text.floatValue;
        _cellMinHeight = _cellMinHeightTextField.text.floatValue;
        _cellMaxHeight = _cellMaxHeightTextField.text.floatValue;
        
        _block(_cellColumn, _cellMargin, _cellMinHeight, _cellMaxHeight);
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void) alterWithString: (NSString *) message{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
    [alter show];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGesture:(id)sender {
    [self.view endEditing:YES];
}


//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
