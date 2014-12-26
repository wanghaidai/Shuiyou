//
//  ViewController.m
//  TaxF
//
//  Created by junyanhao on 14/12/23.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
{
    AccountViewController *account;
    CertificateViewController *certificate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    account = [[AccountViewController alloc] initWithNibName:@"account" bundle:nil];
    [self.myView addSubview:account.view];
    UISegmentedControl *loginChoice = self.loginChoice;
    
    [loginChoice addTarget:self action:@selector(loginChoice:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginChoice:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;

    certificate = [[CertificateViewController alloc] initWithNibName:@"certificate" bundle:nil];
    if(0==control.selectedSegmentIndex)
    {
        [self.myView addSubview:account.view];
    }else
    {
        [self.myView addSubview:certificate.view];
    }
}
@end
