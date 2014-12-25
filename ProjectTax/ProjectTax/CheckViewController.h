//
//  CheckViewController.h
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListingViewController.h"
@interface CheckViewController : UIViewController
@property(nonatomic,strong) ListingViewController *listChoose;
- (IBAction)goBack:(id)sender;
- (IBAction)OnLineCheck:(id)sender;


@end
