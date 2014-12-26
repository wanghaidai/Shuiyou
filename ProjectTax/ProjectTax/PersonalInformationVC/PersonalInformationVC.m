//
//  PersonalInformationVC.m
//  PersonalSetting
//
//  Created by zhengchen on 14/12/24.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import "PersonalInformationVC.h"

@interface PersonalInformationVC ()
@property (strong, nonatomic) NSArray *identityArray;
@property (strong, nonatomic) NSArray *userArray;

-(void)createTableData;
@end

@implementation PersonalInformationVC

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
    self.identityArray = [[NSArray alloc]
                          initWithObjects:@"身份证件类型",@"身份证件号码",@"真实姓名", nil];
    self.userArray  = [[NSArray alloc]
                          initWithObjects:@"用户名",@"手机号",@"邮箱", nil];
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
            return [self.identityArray count];
        case 1:
            return [self.userArray count];
        default:
            return 0;
            break;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [self.identityArray objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.textLabel.text = [self.userArray objectAtIndex:indexPath.row];
            break;
        default:
            cell.textLabel.text = @"UnKown";
            break;
    }
  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleStr;
    IDTypeVC *idTypeVC;
    IDNumberVC *idNumberVC;
    RealNameVC *realNameVC;
    PhoneVC *phoneVC;
    EmailVC *emailVC;
    // UIAlertView *alert;
    switch (indexPath.section) {
        case 0:
            titleStr = [[NSString alloc]
                        initWithFormat:@"%@",[self.identityArray objectAtIndex:indexPath.row]];
            if ([ titleStr isEqualToString:@"身份证件类型"]) {
                idTypeVC = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"idTypeVC"];
                [self.navigationController pushViewController:idTypeVC animated:YES];
            }else if ([titleStr isEqualToString:@"身份证件号码"]){
                idNumberVC = [self.storyboard
                            instantiateViewControllerWithIdentifier:@"idNumberVC"];
                [self.navigationController pushViewController:idNumberVC animated:YES];
            }else{
                realNameVC = [self.storyboard
                              instantiateViewControllerWithIdentifier:@"realNameVC"];
                [self.navigationController pushViewController:realNameVC animated:YES];
            }
            break;
        case 1:
            titleStr = [[NSString alloc]
                        initWithFormat:@"%@",[self.userArray objectAtIndex:indexPath.row]];
            if ([titleStr isEqualToString:@"手机号"]) {
                phoneVC = [self.storyboard
                              instantiateViewControllerWithIdentifier:@"phoneVC"];
                [self.navigationController pushViewController:phoneVC animated:YES];
            }else if([titleStr isEqualToString:@"邮箱"]){
                emailVC = [self.storyboard
                           instantiateViewControllerWithIdentifier:@"emailVC"];
                [self.navigationController pushViewController:emailVC animated:YES];
                
            }else{
                // do nothing
            }
            break;
        default:
            titleStr = [[NSString alloc]
                        initWithFormat:@"UnKown"];
            
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
