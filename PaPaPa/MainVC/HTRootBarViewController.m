//
//  HTRootBarViewController.m
//  PaPaPa
//
//  Created by CHT on 2017/8/2.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import "HTRootBarViewController.h"
#import "HTMainViewController.h"
#import "HTVideoViewController.h"
#import "HTCenterViewController.h"
#import "CHTNavigationController.h"
@interface HTRootBarViewController ()

@end

@implementation HTRootBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    HTMainViewController *vc1 = [[HTMainViewController alloc] init];

    [self setupAttributeOfViewController:vc1 atTitle:@"主界面" atNomalImageName:@"Mine_icon" atSelectedImageName:@"MineSlect_icon"];
    
    HTVideoViewController *vc2 = [[HTVideoViewController alloc] init];
    
    [self setupAttributeOfViewController:vc2 atTitle:@"视频" atNomalImageName:@"tab_homepage1" atSelectedImageName:@"HoneSlect_icon"];
    
    HTCenterViewController *vc3 = [[HTCenterViewController alloc] init];
    
    [self setupAttributeOfViewController:vc3 atTitle:@"我的" atNomalImageName:@"Shop_icon" atSelectedImageName:@"ShopSlect_icon"];
    
    //给每个子控制器添加导航控制器
    CHTNavigationController *nvc1 = [[CHTNavigationController alloc] initWithRootViewController:vc1];
    CHTNavigationController *nvc2 = [[CHTNavigationController alloc] initWithRootViewController:vc2];
    CHTNavigationController *nvc3 = [[CHTNavigationController alloc] initWithRootViewController:vc3];
    
    self.viewControllers = @[nvc1,nvc2,nvc3];
    
}
- (void)setupAttributeOfViewController:(UIViewController *)viewController
                               atTitle:(NSString *)title
                      atNomalImageName:(NSString *)nomalImageName
                   atSelectedImageName:(NSString *)selectedImageName {
    

    // 设置标题
    viewController.tabBarItem.title = title;
    // 设置选中状态的图片
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:nomalImageName];
    // 设置未选中状态的图片
    viewController.tabBarItem.image = [UIImage imageNamed:selectedImageName] ;
    // 设置右上角显示数字(例如: 未读消息数目)
    //viewController.tabBarItem.badgeValue = @"100";
    // 右上角数字背景色
    //viewController.tabBarItem.badgeColor = [UIColor greenColor];
    
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
