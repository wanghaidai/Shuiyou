//
//  ListingViewController.h
//  ProjectTax
//
//  Created by tingtingwang on 14-12-23.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ListPopupDelegate;
@interface ListingViewController : UIViewController
@property (assign, nonatomic) id <ListPopupDelegate>delegate;

- (IBAction)manualCheck:(id)sender;
- (IBAction)codeCheck:(id)sender;
@end

@protocol ListPopupDelegate <NSObject>
@optional
-(void)cancelButtonClicked:(ListingViewController*)listController;

@end
