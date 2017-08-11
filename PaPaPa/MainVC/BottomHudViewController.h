//
//  BottomHudViewController.h
//  PaPaPa
//
//  Created by CHT on 2017/8/7.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomHudViewController : UIViewController
//在底部显示提示语
+ (void)bottomHud:(NSString *)text View:(UIView *)view;
//在中间显示提示语
+ (void)HudOnCentent:(NSString *)text View:(UIView *)view;
//在中间显示图片
+ (void)HUdONCententImage:(NSString *)imageName View:(UIView *)view;

@end
