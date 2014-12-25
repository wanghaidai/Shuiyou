//
//  ForecastCell.h
//  ProjectTax
//
//  Created by tingtingwang on 14-12-25.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *applyDate;
@property (strong, nonatomic) IBOutlet UILabel *taxDate;
@property (strong, nonatomic) IBOutlet UILabel *printArea;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction)download:(id)sender;
- (IBAction)checkDownload:(id)sender;


@end
