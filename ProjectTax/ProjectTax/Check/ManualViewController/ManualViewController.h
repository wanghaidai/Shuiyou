//
//  Manual ViewController.h
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManualViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

- (IBAction)chooseID:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *IDType;
- (IBAction)goBack1:(id)sender;
@property(nonatomic,strong)UITableView *tableIDView;
@end
