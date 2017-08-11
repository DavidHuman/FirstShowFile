//
//  CHTNavigationController.m
//  PaPaPa
//
//  Created by CHT on 2017/8/7.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import "CHTNavigationController.h"
#import "PopActionHandler.h"
@interface UIViewController (popActionHandler) <PopActionHandler>

@end

@interface CHTNavigationController ()<UINavigationBarDelegate,UIGestureRecognizerDelegate>

@end

@implementation CHTNavigationController


+ (void)initialize{
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    [UINavigationBar appearance].barTintColor = yyNavigationBarColor;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        if (self.childViewControllers.count > 2) {
            UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
            [backButton setTitle:@"返回" forState:UIControlStateNormal];
            [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            [backButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
            backButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [backButton sizeToFit];
            [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
            backButton.width = backButton.width + 5;
            [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
            
            UIButton *backToRootButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
            [backToRootButton setTitle:@"首页" forState:UIControlStateNormal];
            [backToRootButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
            backToRootButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [backToRootButton sizeToFit];
            [backToRootButton addTarget:self action:@selector(backToRootButtonAction) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backToRootItem = [[UIBarButtonItem alloc] initWithCustomView:backToRootButton];
            viewController.navigationItem.leftBarButtonItems = @[backItem,backToRootItem];
        }else {
            UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
            [backButton setTitle:@"返回" forState:UIControlStateNormal];
            [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            [backButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
            backButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
            [backButton sizeToFit];
            backButton.width = backButton.width + 5;
            [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
            
            viewController.navigationItem.leftBarButtonItem = backItem;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated {
    for (int i = 0; i < viewControllers.count; i ++) {
        UIViewController *viewController = viewControllers[i];
        if (i > 0) {
            viewController.hidesBottomBarWhenPushed = YES;
            if (i > 2) {
                UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
                [backButton setTitle:@"返回" forState:UIControlStateNormal];
                [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
                [backButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
                backButton.titleLabel.font = [UIFont systemFontOfSize:14];
                [backButton sizeToFit];
                [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
                backButton.width = backButton.width + 5;
                [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
                UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
                
                UIButton *backToRootButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
                [backToRootButton setTitle:@"首页" forState:UIControlStateNormal];
                [backToRootButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
                backToRootButton.titleLabel.font = [UIFont systemFontOfSize:14];
                [backToRootButton sizeToFit];
                [backToRootButton addTarget:self action:@selector(backToRootButtonAction) forControlEvents:UIControlEventTouchUpInside];
                UIBarButtonItem *backToRootItem = [[UIBarButtonItem alloc] initWithCustomView:backToRootButton];
                viewController.navigationItem.leftBarButtonItems = @[backItem,backToRootItem];
            }else {
                UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
                [backButton setTitle:@"返回" forState:UIControlStateNormal];
                [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
                [backButton setTitleColor:YYWhiteColor forState:UIControlStateNormal];
                backButton.titleLabel.font = [UIFont systemFontOfSize:14];
                [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
                [backButton sizeToFit];
                backButton.width = backButton.width + 5;
                [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
                UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
                
                viewController.navigationItem.leftBarButtonItem = backItem;
            }
        }
    }
    [super setViewControllers:viewControllers animated:animated];
}

- (void)backAction {
    if ([self.topViewController respondsToSelector:@selector(navigationControllerInterceptPopAction:)]) {
        [self.topViewController navigationControllerInterceptPopAction:self];
    }else {
        [self popViewControllerAnimated:YES];
    }
}
- (void)backToRootButtonAction {
    if ([self.topViewController respondsToSelector:@selector(navigationControllerInterceptPopToRootAction:)]) {
        [self.topViewController navigationControllerInterceptPopToRootAction:self];
    }else {
        [self popToRootViewControllerAnimated:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
