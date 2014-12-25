//
//  ListingViewController.m
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import "ListingViewController.h"
#import "ManualViewController.h"
#import "UIViewController+MJPopupViewController.h"
@interface ListingViewController (){
    ManualViewController *man;
}

@end

@implementation ListingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // [[NSBundle mainBundle]loadNibNamed:@"ListingViewController" owner:self options:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)manualCheck:(id)sender {
   // [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"myMan" object:nil];
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonClicked:)]) {
        [self.delegate cancelButtonClicked:self];
    }
}

- (IBAction)codeCheck:(id)sender {
  //   [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"myCode" object:nil];
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonClicked:)]) {
        [self.delegate cancelButtonClicked:self];
    }
}


@end
