//
//  BottomHudViewController.m
//  PaPaPa
//
//  Created by CHT on 2017/8/7.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import "BottomHudViewController.h"
#define timeDelay 1.5
@interface BottomHudViewController ()

@end

@implementation BottomHudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//在底部显示提示语
+ (void)bottomHud:(NSString *)text View:(UIView *)view{
    UIView *hudView = [[UIView alloc] initWithFrame:CGRectMake(0,MainHeight * 0.7f , MainWidth, MainHeight * 0.3f)];
    hudView.backgroundColor = [UIColor clearColor];
    [view addSubview:hudView];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    [hud hideAnimated:YES afterDelay:timeDelay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hudView removeFromSuperview];
    });
}
//在中间显示提示语
+ (void)HudOnCentent:(NSString *)text View:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    [hud hideAnimated:YES afterDelay:timeDelay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud removeFromSuperview];
    });
}
//在中间显示图片
+ (void)HUdONCententImage:(NSString *)imageName View:(UIView *)view{
    //还不想做,想做的时候在做
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
