//
//  IDNumberVC.h
//  PersonalSetting
//
//  Created by zhengchen on 14/12/25.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDNumberVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *IDNumberTextField;
- (IBAction)submitIDNumberApplication:(id)sender;
@end
