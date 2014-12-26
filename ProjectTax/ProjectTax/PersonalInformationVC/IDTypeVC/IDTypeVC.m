//
//  IDTypeVC.m
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import "IDTypeVC.h"

@interface IDTypeVC ()
@property (strong, nonatomic) NSArray *identityArray;
@property (assign, nonatomic) int currentIndex;
@end

@implementation IDTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableData{
    self.identityArray = [[NSArray alloc]
                          initWithObjects:@"居民身份证",@"港澳台通行证",@"机动车驾驶证", nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.identityArray count];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentityCell"];
    cell.textLabel.text = [self.identityArray objectAtIndex:indexPath.row];
    return cell;
}

-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == self.currentIndex){
        return UITableViewCellAccessoryCheckmark;
    }else{
        return UITableViewCellAccessoryNone;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == self.currentIndex) {
        return;
    }
    NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.currentIndex
                                                   inSection:0];
    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    if (newCell.accessoryType == UITableViewCellAccessoryNone) {
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
    if (oldCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        oldCell.accessoryType = UITableViewCellAccessoryNone;
    }
    self.currentIndex = indexPath.row;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitApplication:(id)sender {
}
- (IBAction)submitIDTypeApplication:(id)sender {
}
@end
