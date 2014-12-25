//
//  MyTaxListingViewController.h
//  ProjectTax
//
//  Created by tingtingwang on 14-12-24.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastCell.h"
@interface MyTaxListingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *startDate;
@property (strong, nonatomic) IBOutlet UITextField *endDate;
- (IBAction)startChoose:(id)sender;
- (IBAction)endChoose:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)UIView *indexHeaderView;
@property(strong,nonatomic)NSMutableArray *forecastSection;
@end
