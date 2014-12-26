//
//  PwdModifyVC.h
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PwdModifyVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPwdTextField;

@property (weak, nonatomic) IBOutlet UITextField *nnewPwdTextField;

@property (weak, nonatomic) IBOutlet UITextField *cfmPwdTextField;

- (IBAction)savePwd:(id)sender;

@end
