//
//  ViewController.m
//  demo
//
//  Created by Admin on 14/12/23.
//  Copyright (c) 2014年 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fromDatetextfield;
@property (weak, nonatomic) IBOutlet UITextField *toDatetextfield;
- (IBAction)chooseDate:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((datepicker *)segue.destinationViewController).delegate=self;
}


- (IBAction)chooseDate:(id)sender {
    if (!self.dateChooserVisible) {
    [self performSegueWithIdentifier:@"toDateChooser" sender:sender];
     self.dateChooserVisible=YES;
}

}
-(void)showchoosedate:(NSDate *)chosenDate{
    NSDateFormatter *dateFormat;
    NSString *chosenDateString;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM , yyyy "];
    chosenDateString = [dateFormat stringFromDate:chosenDate];
    self.fromDatetextfield.text=chosenDateString;
}

-(void)toshowchoosedate:(NSDate *)tochosenDate{
    NSDateFormatter *todateFormat;
    NSString *tochosenDateString;
    todateFormat = [[NSDateFormatter alloc] init];
    [todateFormat setDateFormat:@"MMMM , yyyy "];
    tochosenDateString = [todateFormat stringFromDate:tochosenDate];
    self.toDatetextfield.text=tochosenDateString;
}





@end
