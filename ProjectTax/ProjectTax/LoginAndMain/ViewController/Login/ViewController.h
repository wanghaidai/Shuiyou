//
//  ViewController.h
//  TaxF
//
//  Created by junyanhao on 14/12/23.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountViewController.h"
#import "CertificateViewController.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *myView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *loginChoice;
- (IBAction)loginChoice:(id)sender;






@end

