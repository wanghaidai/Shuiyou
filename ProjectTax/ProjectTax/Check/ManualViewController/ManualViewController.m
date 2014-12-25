//
//  Manual ViewController.m
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import "ManualViewController.h"

@interface ManualViewController (){
      NSArray *testArray;
}

@end

@implementation ManualViewController
@synthesize tableIDView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBar.hidden=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    testArray=@[@"居民身份证",@"港澳台通行证",@"机动车驾驶证"];
    self.tableIDView=[[UITableView alloc]initWithFrame:CGRectMake(137, 120, 160, 150)style:UITableViewStylePlain];
    self.tableIDView.delegate=self;
    self.tableIDView.dataSource=self;
    self.tableIDView.separatorColor=[UIColor grayColor];
    [self.view addSubview:self.tableIDView];
    self.tableIDView.hidden=YES;
    self.IDType.text=@"居民身份证";
    self.tableIDView.layer.borderWidth=1;
    self.tableIDView.layer.borderColor=[[UIColor lightGrayColor]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack1:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return testArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result=50.0f;
    return result;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.textLabel.font = [UIFont systemFontOfSize:13.0];
    }
    
    [cell.textLabel setTextColor:[UIColor grayColor]];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.textLabel.text = testArray[indexPath.row];
    
    if ([self.IDType.text isEqual:cell.textLabel.text]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
        [cell.textLabel setTextColor:[UIColor blackColor]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.IDType.text=[testArray objectAtIndex:[indexPath row]];
    self.tableIDView.hidden=YES;
    [self.tableIDView reloadData];
    NSLog(@"%@",self.IDType.text);
}
- (IBAction)chooseID:(id)sender {
     [tableIDView setHidden:NO];
}
@end
