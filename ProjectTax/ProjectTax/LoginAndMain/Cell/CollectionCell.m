//
//  CollectionCell.m
//  TaxF
//
//  Created by junyanhao on 14/12/24.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        if(arrayOfViews.count<1)
        {
            return nil;
        }
        if(![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

@end
