//
//  CodeViewController.m
//  ProjectTax
//
//  Created by tingtingwang on 14-12-24.
//  Copyright (c) 2014年 tingtingwang. All rights reserved.
//

#import "CodeViewController.h"
#import "ZBarSDK.h"
#define SCANVIEW_EdgeTop 40.0
#define SCANVIEW_EdgeLeft 50.0
#define TINCOLOR_ALPHA 0.2 //浅色透明度
#define DARKCOLOR_ALPHA 0.5 //深色透明度
@interface CodeViewController ()<ZBarReaderViewDelegate>{
    UIView *_QrCodeline;
    NSTimer *_timer;
    
    //设置扫描画面
    UIView *_scanView;
    ZBarReaderView *_readerView;
}

@end

@implementation CodeViewController

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
    self.navigationController.navigationBar.hidden=YES;
    [super viewDidLoad];
    self.title=@"扫描二维码";
    
//    //初始化扫描界面
//    [self setScanView];
//    
//    _readerView=[[ZBarReaderView alloc]init];
//    _readerView.frame=CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64);
//    _readerView.tracksSymbols=NO;
//    _readerView.readerDelegate=self;
//    [_readerView addSubview:_scanView];
//    [self.view addSubview:_readerView];
//    [_readerView start];
//    [self createTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack2:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image{
    const zbar_symbol_t *symbol=zbar_symbol_set_first_symbol(symbols.zbarSymbolSet);
    NSString *symbolStr=[NSString stringWithUTF8String:zbar_symbol_get_data(symbol)];
    
    //判断是否包含 头'http:'
    NSString *regex=@"http+:[^\\s]*";
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:symbolStr delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alertView show];
    
    //判断是否包含 头'ssid:'
    NSString *ssid =@"ssid+:[^\\s]*";
    NSPredicate *ssidPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ssid];
    if ([predicate evaluateWithObject:symbolStr]) {
        
    }else if ([ssidPre evaluateWithObject:symbolStr]){
        NSArray *arr=[symbolStr componentsSeparatedByString:@";"];
        NSArray *arrInfoHead=[[arr objectAtIndex:0]componentsSeparatedByString:@":"];
        NSArray *arrInfoFoot=[[arr objectAtIndex:1]componentsSeparatedByString:@":"];
        
        symbolStr=[NSString stringWithFormat:@"ssid: %@ \n password:%@",[arrInfoHead objectAtIndex:1],[arrInfoFoot objectAtIndex:1]];
        UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
          //然后，可以使用如下代码来把一个字符串放置到剪贴板上：
        pasteboard.string=[arrInfoFoot objectAtIndex:1];
    }
}
////二维码的扫描区域
//-(void)setScanView{
//    _scanView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
//    _scanView.backgroundColor=[UIColor clearColor];
//    
//    //最上部view
//    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, SCANVIEW_EdgeTop)];
//    upView.alpha=TINCOLOR_ALPHA;
//    upView.backgroundColor=[UIColor blackColor];
//    [_scanView addSubview:upView];
//    
//    //左侧的view
//    UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, SCANVIEW_EdgeTop, SCANVIEW_EdgeLeft, VIEW_WIDTH-2*SCANVIEW_EdgeLeft)];
//    leftView.alpha=TINCOLOR_ALPHA;
//    leftView.backgroundColor=[UIColor blackColor];
//    [_scanView addSubview:leftView];
//    
//    /******************中间扫描区域****************************/
//    UIImageView *scanCropView=[[UIImageView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft,SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft,VIEW_WIDTH-2*SCANVIEW_EdgeLeft)];
//    scanCropView.layer.borderColor=[UIColor getThemeColor].;
//    scanCropView.layer.borderWidth=2.0;
//    
//    scanCropView.backgroundColor=[UIColor clearColor];
//    [_scanView addSubview:scanCropView];
//}
@end
