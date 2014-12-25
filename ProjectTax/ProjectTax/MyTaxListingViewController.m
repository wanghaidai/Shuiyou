//
//  MyTaxListingViewController.m
//  ProjectTax
//
//  Created by tingtingwang on 14-12-24.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import "MyTaxListingViewController.h"

@interface MyTaxListingViewController ()

@end

@implementation MyTaxListingViewController

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
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView .autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.forecastSection=[NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.forecastSection containsObject:[NSNumber numberWithInteger:section]]) {
        return 0;
    }else
        return 1;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    self.indexHeaderView=[[[NSBundle mainBundle]loadNibNamed:@"IndexHeaderView" owner:self options:NULL]lastObject];
    UILabel *orderLabel=(UILabel *)[self.indexHeaderView viewWithTag:101];
    UILabel *descriptionLabel=(UILabel *)[self.indexHeaderView viewWithTag:102];
    UILabel *orderNumLabel=(UILabel *)[self.indexHeaderView viewWithTag:103];
    UILabel *orderDateLabel=(UILabel *)[self.indexHeaderView viewWithTag:104];
    UIButton *button=(UIButton *)[self.indexHeaderView viewWithTag:2];
    button.tag=section;
    [button addTarget:self action:@selector(sectionViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button.selected=NO;
    
    if ([self.forecastSection containsObject:[NSNumber numberWithInteger:section]]) {
        button.selected=YES;
    }
    orderLabel.text=[NSString stringWithFormat:@"%ld",section+1];
    return self.indexHeaderView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 47;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 159;
}
- (IBAction)startChoose:(id)sender {
    
}
- (IBAction)endChoose:(id)sender {
    
}
-(void)sectionViewClick:(id)sender{
    UIButton *button=(UIButton *)sender;
    NSInteger tag=button.tag;
    button.selected=NO;
    
    if ([self.forecastSection containsObject:[NSNumber numberWithInteger:tag]]) {
        [self.forecastSection removeObject:[NSNumber numberWithInteger:tag]];
    }else{
        [self.forecastSection addObject:[NSNumber numberWithInteger:tag]];
    }
        [self.tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *accountCellIdentifer=@"tablecell";
    ForecastCell *cell=[tableView dequeueReusableCellWithIdentifier:accountCellIdentifer];
    if (cell==nil) {
        cell=[[ForecastCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:accountCellIdentifer];
    }
     cell.selectionStyle=UITableViewCellSelectionStyleNone;
     return cell;
}
@end
