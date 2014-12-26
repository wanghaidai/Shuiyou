//
//  TaxViewController.m
//  TaxF
//
//  Created by junyanhao on 14/12/23.
//  Copyright (c) 2014年 Insigma Hengtian Software Ltd. All rights reserved.
//

#import "TaxViewController.h"

@interface TaxViewController ()

@end

@implementation TaxViewController
@synthesize myData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myData = [[NSArray alloc] initWithObjects:@"纳税明细查询", @"纳税清单申请",@"我的纳税清单",@"清单在线校验",nil];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    
    
    // Do any additional setup after loading the view.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.myData count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.label.text = [self.myData objectAtIndex:indexPath.row];
    cell.label.font = [UIFont systemFontOfSize:12];
    
    return cell;
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

@end
