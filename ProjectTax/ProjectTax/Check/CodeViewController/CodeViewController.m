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
#define VIEW_WIDTH   UIScreen.mainScreen.bounds.size.width
#define VIEW_HEIGHT  UIScreen.mainScreen.bounds.size.height
@interface CodeViewController ()<ZBarReaderViewDelegate>{
    UIView *_QrCodeline;
    NSTimer *_timer;
    
    //设置扫描画面
    UIView *_scanView;
    ZBarReaderView *_readerView;
}

@end

@implementation CodeViewController
@synthesize openButton;
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
    [self setScanView];
    
    _readerView=[[ZBarReaderView alloc]init];
    _readerView.frame=CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64);
    _readerView.tracksSymbols=NO;
    _readerView.readerDelegate=self;
    [_readerView addSubview:_scanView];
    
    //关闭闪光灯
    _readerView.torchMode =0;
    
    [self.view addSubview:_readerView];
    [_readerView start];
    [self createTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack2:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openButton:(id)sender {
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
//二维码的扫描区域
-(void)setScanView{
    _scanView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    _scanView.backgroundColor=[UIColor clearColor];
    
    //最上部view
    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, SCANVIEW_EdgeTop)];
    upView.alpha=TINCOLOR_ALPHA;
    upView.backgroundColor=[UIColor blackColor];
    [_scanView addSubview:upView];
    
    //左侧的view
    UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, SCANVIEW_EdgeTop, SCANVIEW_EdgeLeft, VIEW_WIDTH-2*SCANVIEW_EdgeLeft)];
    leftView.alpha=TINCOLOR_ALPHA;
    leftView.backgroundColor=[UIColor blackColor];
    [_scanView addSubview:leftView];
    
    /******************中间扫描区域****************************/
    UIImageView *scanCropView=[[UIImageView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft,SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft,VIEW_WIDTH-2*SCANVIEW_EdgeLeft)];
    scanCropView.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    scanCropView.layer.borderWidth=2.0;
    
    scanCropView.backgroundColor=[UIColor clearColor];
    [_scanView addSubview:scanCropView];
    
    //右侧的view
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_WIDTH-SCANVIEW_EdgeLeft,SCANVIEW_EdgeTop, SCANVIEW_EdgeLeft,VIEW_WIDTH-2*SCANVIEW_EdgeLeft)];
    rightView.alpha =TINCOLOR_ALPHA;
    rightView.backgroundColor = [UIColor blackColor];
    [_scanView addSubview:rightView];
    
    //底部view
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0,VIEW_WIDTH-2*SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop,VIEW_WIDTH, VIEW_HEIGHT-(VIEW_WIDTH-2*SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop)-64)];
    //downView.alpha = TINTCOLOR_ALPHA;
    downView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:TINCOLOR_ALPHA];
    [_scanView addSubview:downView];
    
    //用于说明的label
    UILabel *labIntroudction= [[UILabel alloc] init];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.frame=CGRectMake(0,5, VIEW_WIDTH,20);
    labIntroudction.numberOfLines=1;
    labIntroudction.font=[UIFont systemFontOfSize:15.0];
    labIntroudction.textAlignment=NSTextAlignmentCenter;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"将二维码对准方框，即可自动扫描";
    [downView addSubview:labIntroudction];
    

    //开灯
    [openButton addTarget:self action:@selector(openLight)forControlEvents:UIControlEventTouchUpInside];

    
    
    //画中间的基准线
    _QrCodeline = [[UIView alloc] initWithFrame:CGRectMake(SCANVIEW_EdgeLeft,SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft,2)];
    _QrCodeline.backgroundColor = [UIColor blueColor];
    [_scanView addSubview:_QrCodeline];
}
- (void)openLight
{
    if (_readerView.torchMode ==0) {
        _readerView.torchMode =1;
    }else
    {
        _readerView.torchMode =0;
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (_readerView.torchMode ==1) {
        _readerView.torchMode =0;
    }
    [self stopTimer];
    
    [_readerView stop];
    
}

//二维码的横线移动
- (void)moveUpAndDownLine
{
    CGFloat Y=_QrCodeline.frame.origin.y;
    //CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft, 1)]
    if (VIEW_WIDTH-2*SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop==Y){
        
        [UIView beginAnimations:@"asa" context:nil];
        [UIView setAnimationDuration:1];
        _QrCodeline.frame=CGRectMake(SCANVIEW_EdgeLeft, SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft,1);
        [UIView commitAnimations];
    }else if(SCANVIEW_EdgeTop==Y){
        [UIView beginAnimations:@"asa" context:nil];
        [UIView setAnimationDuration:1];
        _QrCodeline.frame=CGRectMake(SCANVIEW_EdgeLeft, VIEW_WIDTH-2*SCANVIEW_EdgeLeft+SCANVIEW_EdgeTop, VIEW_WIDTH-2*SCANVIEW_EdgeLeft,1);
        [UIView commitAnimations];
    }
    
}
- (void)createTimer
{
    //创建一个时间计数
    _timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(moveUpAndDownLine) userInfo:nil repeats:YES];
}

- (void)stopTimer
{
    if ([_timer isValid] == YES) {
        [_timer invalidate];
        _timer =nil;
    }
}

@end
