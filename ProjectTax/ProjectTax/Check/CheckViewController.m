//
//  CheckViewController.m
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import "CheckViewController.h"
#include "UIViewController+MJPopupViewController.h"
#import "ListingViewController.h"
@interface CheckViewController ()

@end

@implementation CheckViewController
@synthesize listChoose;
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
    // Do any additional setup after loading the view.
     self.navigationController.navigationBar.hidden=YES;
      [[NSNotificationCenter defaultCenter] addObserver:self
           selector:@selector(getNotice:)name:@"myMan" object:nil];
       [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(getNotice:)name:@"myCode" object:nil];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)OnLineCheck:(id)sender {
    listChoose=nil;
    listChoose=[[ListingViewController alloc]init];
    [self presentPopupViewController:listChoose animationType:MJPopupViewAnimationFade];

}

-(void)getNotice:(NSNotification *) notification{
    [self cancelButtonCloicked:listChoose];
    if ([@"myMan" isEqual:notification.name]) {
        [self performSegueWithIdentifier:@"manual" sender:self];
       
    }else{
        //  [self.listChoose dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
        [self performSegueWithIdentifier:@"code" sender:self];
    }
    
}
-(void)cancelButtonCloicked:(ListingViewController *)listController{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    listController=nil;
}
@end
