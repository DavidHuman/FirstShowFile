//
//  PopActionHandler.h
//  YYFramework
//
//  Created by 洛克韦驼 on 16/8/29.
//  Copyright © 2016年 YueYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopActionHandler <NSObject>
// 拦截返回按钮点击事件
- (void)navigationControllerInterceptPopAction:(UINavigationController *)navigationController;
// 拦截返回首页按钮点击事件
- (void)navigationControllerInterceptPopToRootAction:(UINavigationController *)navigationController;
@end
