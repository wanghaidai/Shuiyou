//
//  EmailSubscribeVC.m
//  PersonalSetting
//
//  Created by zhengchen on 14/12/24.
//  Copyright (c) 2014年 zhengchen. All rights reserved.
//

#import "EmailSubscribeVC.h"

@interface EmailSubscribeVC ()

@end

@implementation EmailSubscribeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)emailSubscribe:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:nil
                          delegate:self
                          cancelButtonTitle:@"退出"
                          otherButtonTitles:@"取消订阅",@"邮件订阅", nil];
    [alert show];
}
@end
