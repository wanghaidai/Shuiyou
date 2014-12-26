//
//  CancellationVC.m
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import "CancellationVC.h"

@interface CancellationVC ()
@property (strong, nonatomic) NSArray *identityArray;
@end

@implementation CancellationVC

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
                          initWithObjects:@"身份证件类型",@"身份证件号码",@"真实姓名", nil];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cfmCancel:(id)sender {
}

@end
