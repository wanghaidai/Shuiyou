//
//  EmailSubscribeVC.h
//  PersonalSetting
//
//  Created by zhengchen on 14/12/24.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailSubscribeVC : UIViewController

- (IBAction)emailSubscribe:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *cfmButton;
@end
