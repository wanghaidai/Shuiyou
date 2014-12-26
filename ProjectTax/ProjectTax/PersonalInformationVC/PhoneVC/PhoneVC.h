//
//  PhoneVC.h
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;

- (IBAction)getVerificationCode:(id)sender;

- (IBAction)changePhoneNumber:(id)sender;
@end
