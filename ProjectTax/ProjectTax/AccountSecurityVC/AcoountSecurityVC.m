//
//  AcoountSecurityVC.m
//  PersonalSetting
//
//  Created by zhengchen on 14/12/24.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import "AcoountSecurityVC.h"

@interface AcoountSecurityVC ()
@property (strong, nonatomic) NSArray *pwdArray;
@property (strong, nonatomic) NSArray *accountArray;
-(void)createTableData;
@end

@implementation AcoountSecurityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createTableData{
    self.pwdArray = [[NSArray alloc]
                     initWithObjects:@"登录密码修改", nil];
    self.accountArray = [[NSArray alloc]
                         initWithObjects:@"账户注销", nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return [self.pwdArray count];
        case 1:
            return [self.accountArray count];
        default:
            return 0;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell"];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self.pwdArray objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [self.accountArray objectAtIndex:indexPath.row];
            break;
        default:
            cell.textLabel.text = @"UnKown";
          
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PwdModifyVC    *pwdVC;
    CancellationVC *cancelVC;
    
    switch (indexPath.section) {
        case 0:
            pwdVC = [self.storyboard
                     instantiateViewControllerWithIdentifier:@"ModifyVC"];
            [self.navigationController pushViewController:pwdVC animated:YES];
            break;
        case 1:
            cancelVC = [self.storyboard
                        instantiateViewControllerWithIdentifier:@"CancellationVC"];
            [self.navigationController pushViewController:cancelVC animated:YES];
            break;
        default:
            break;
    }
    
}
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
