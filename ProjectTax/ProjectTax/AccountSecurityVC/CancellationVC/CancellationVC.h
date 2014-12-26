//
//  CancellationVC.h
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancellationVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *cancelReasonTextField;

- (IBAction)cfmCancel:(id)sender;

@end
