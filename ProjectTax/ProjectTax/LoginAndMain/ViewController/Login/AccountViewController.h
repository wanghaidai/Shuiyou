//
//  AccountViewController.h
//  TaxF
//
//  Created by junyanhao on 14/12/23.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AccountViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accountRem;
- (IBAction)verifyLogin:(id)sender;


@end
