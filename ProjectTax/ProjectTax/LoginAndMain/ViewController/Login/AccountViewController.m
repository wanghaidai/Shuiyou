//
//  AccountViewController.m
//  TaxF
//
//  Created by junyanhao on 14/12/23.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import "AccountViewController.h"
#import "TabBarViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *psdCheckBox = [[UIButton alloc] initWithFrame:CGRectMake(47, 90, 20, 20)];
    psdCheckBox.backgroundColor = [UIColor redColor];
    [self.view addSubview:psdCheckBox];
    UIButton *loginCheckBox = [[UIButton alloc] initWithFrame:CGRectMake(130, 90, 20, 20)];
    loginCheckBox.backgroundColor = [UIColor redColor];
    [self.view addSubview:loginCheckBox];
    UILabel *remPassqord = self.accountRem;
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:@"忘记密码？"];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    remPassqord.attributedText = content;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    remPassqord.userInteractionEnabled = YES;
    [remPassqord addGestureRecognizer:tapRecognizer];
    
    
    
    

    // Do any additional setup after loading the view.
}
-(void)click:(id)sender
{
    NSString *path = [NSString stringWithFormat:@"http://www.baidu.com"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];
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


- (IBAction)verifyLogin:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TabBarViewController *tabBarViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"myTabBar"];
    [self presentViewController:tabBarViewController animated:YES completion:nil];
}
@end
