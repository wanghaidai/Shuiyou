//
//  datepicker.m
//  demo
//
//  Created by Admin on 14/12/23.
//  Copyright (c) 2014年 Admin. All rights reserved.
//

#import "datepicker.h"

@interface datepicker ()
- (IBAction)dismissdateChooser:(id)sender;
- (IBAction)setDateTime:(id)sender;
- (IBAction)tosetDateTime:(id)sender;

@end

@implementation datepicker


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
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [(ViewController *)self.delegate showchoosedate:[NSDate date]];
    [(ViewController *)self.delegate showchoosedate:[NSDate date]];

}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    ((ViewController *)self.delegate).dateChooserVisible=NO;
}

- (IBAction)dismissdateChooser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender {
    [(ViewController *)self.delegate showchoosedate:((UIDatePicker *)sender).date];
}

- (IBAction)tosetDateTime:(id)sender {
    [(ViewController *)self.delegate toshowchoosedate:((UIDatePicker *)sender).date];
}



@end
