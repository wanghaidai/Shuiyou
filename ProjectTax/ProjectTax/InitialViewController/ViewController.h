//
//  ViewController.h
//  demo
//
//  Created by Admin on 14/12/23.
//  Copyright (c) 2014年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "datepicker.h"

@interface ViewController : UIViewController
@property (nonatomic) Boolean dateChooserVisible;
- (void)showchoosedate:(NSDate *)chosenDate;
- (void)toshowchoosedate:(NSDate *)chosenDate;
@end

