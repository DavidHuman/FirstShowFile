//
//  url.h
//  PaPaPa
//
//  Created by CHT on 2017/8/7.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#ifndef url_h
#define url_h
// 内网开发
#define kBaseUrl @"http://192.168.1.44/wpapi"
#define kBaseH5 @"http://192.168.1.44:82/html"
#define kFileUrl @"http://192.168.1.44:82/upload"
#define kDeviceCapturePictureUrl @"http://192.168.1.44:82/device"

#define kUserID [[NSUserDefaults standardUserDefaults] stringForKey:@"UserID"]
#define kToken [[NSUserDefaults standardUserDefaults] stringForKey:@"token"]


//登录
#define kLogin [NSString stringWithFormat:@"%@/wpapi/MemberController/login.hn",kBaseUrl]
//获取商城首页轮播图
#define kCommodityHome [NSString stringWithFormat:@"%@/wpapi/commoditycontroller/getCommodityHomePage.hn",kBaseUrl]
#endif /* url_h */
