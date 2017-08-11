//
//  LoginViewController.m
//  PaPaPa
//
//  Created by CHT on 2017/8/2.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import "LoginViewController.h"
#import "MD5Util.h"
#import "HTRootBarViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
//登录
- (IBAction)logInBtn:(id)sender {
    if (self.nameField.text.length == 0) {
         SHOW_CONTENT(@"请输入账号", self.view);
        return;
    }
    if (self.pwdField.text.length == 0) {
        SHOW_CONTENT(@"请输入密码", self.view);
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
    NSDictionary *params = @{
                             @"phone":self.nameField.text,
                             @"password":[MD5Util md5:self.pwdField.text]
                             };
    
    
    [[HttpRequest sharedInstance] postWithURLString:kLogin parameters:params success:^(id responseObject) {
        [hud setHidden:YES];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",resultDic);
        NSArray *arr = resultDic[@"root"];
        if (resultDic && arr.count > 0) {
        //存储token和userID
        NSDictionary *_dic = [arr objectAtIndex:0];
        NSString *token = resultDic[@"token"];
        NSString *UserID = [_dic objectForKey:@"wp_member_info_id"];
        //[self saveNSUserID:UserID token:token userInfo:_dic];
        [self saveNSUserID:UserID token:token userInfor:_dic];
        //登录成功 设置新的根视图
        HTRootBarViewController *rootVC = [[HTRootBarViewController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
        }
        
    } failure:^(NSError *error) {
         [hud setHidden:YES];
         SHOW_CONTENT(@"登录失,败检查网络", self.view);
    }];
    
}
- (void)saveNSUserID:(NSString *)userID token:(NSString *)token userInfor:(NSDictionary *)modelDic{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userID forKey:@"UserID"];
    [userDefaults setObject:token forKey:@"token"];
    [userDefaults synchronize];
}

//注册
- (IBAction)reginBtn:(id)sender {
    
    
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
