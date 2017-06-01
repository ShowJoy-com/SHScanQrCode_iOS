//
//  ViewController.m
//  ScanQrCode
//
//  Created by guo on 16/6/16.
//  Copyright © 2016年 YunRuo. All rights reserved.
//

#import "ViewController.h"
#import "ScanQrCodeViewController.h"
#import "UIView+Recognize.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray * marr = [NSArray arrayWithObjects:@"生成二维码",@"二维码扫描", nil];
    for (int i=0; i<marr.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[marr objectAtIndex:i] forState:UIControlStateNormal];
        btn.frame=CGRectMake(100, 100*i, 100, 100);
        btn.tag=i+100;
        [btn addTarget:self action:@selector(pushToSYQRCodeViewController:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

/**
 *  二维码扫描页跳转
 */
-(void)pushToSYQRCodeViewController:(UIButton *)btn{
    if (btn.tag==100) {
        [self.view createImage:CGSizeMake(1080, 1080) withUrl:@"http://m.showjoy.com" successBlock:^(id image) {
            NSLog(@"%@",image);
            [self addImageView:image];
        }];
    }else if (btn.tag==101) {
        [self pushScanCode];
    }
    
}

-(void)addImageView:(UIImage *)iamge{
    UIImageView *miamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    [self.view addSubview:miamgeView];
    [miamgeView setImage:iamge];
    miamgeView.backgroundColor=[UIColor greenColor];
}

-(void)pushScanCode{
    ScanQrCodeViewController *qrcodevc = [[ScanQrCodeViewController alloc] init];
    [qrcodevc setOverlayPickerViewWithLineImage:[UIImage imageNamed:@"LineSao"] withSize:CGSizeMake(240, 4)];
    [qrcodevc createBackBtnWithBackImage:[UIImage imageNamed:@"SaoBack"] withSize:CGSizeMake(40, 40)];
    qrcodevc.ScanQrCodeSuncessBlock = ^(ScanQrCodeViewController *aqrvc,NSString *qrString){
        
    };
    qrcodevc.ScanQrCodeFailBlock = ^(ScanQrCodeViewController *aqrvc){
        
    };
    qrcodevc.ScanQrCodeCancleBlock = ^(ScanQrCodeViewController *aqrvc){
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
    [self presentViewController:qrcodevc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
