//
//  HttpRequest.h
//  PaPaPa
//
//  Created by CHT on 2017/8/4.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UploadParam;
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    //get 请求
    HttpRequestTypeGet = 0,
    //post 请求
    HttpRequestTypePost
};
@interface HttpRequest : NSObject

+ (instancetype)sharedInstance;

/**
 发送get请求

 @param URLString 请求的网址字符串
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure;

/**
 发送post请求

 @param URLString 请求的网址字符串
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
- (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void(^)(id responseObject))success
                  failure:(void(^)(NSError *error))failure;

/**
 发送网络请求

 @param URLString 请求的网址字符串
 @param parameters 请求的参数
 @param type 请求的类型
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
- (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
                     success:(void(^)(id responseObject))success
                     failure:(void(^)(NSError *error))failure;

/**
 上传图片

 @param URLString 上传图片的网络字符串
 @param parameters 上传图片的参数
 @param uploadParam 上传图片的信息
 @param success 上传成功的回调
 @param failure 上传失败的回调
 */
- (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(NSArray <UploadParam *> *)uploadParam
                    success:(void(^)())success
                    failure:(void(^)(NSError *error))failure;

/**
 下载数据

 @param URLString 下载数据的网址
 @param parameters 下载数据的参数
 @param progress 下载的进程
 @param success  下载成功的回调
 @param failure 下载失败的回调
 */
- (void)downLoadWithURLString:(NSString *)URLString
                   parameters:(id)parameters
                     progress:(void(^)())progress
                      success:(void(^)())success
                      failure:(void(^)(NSError *error))failure;
@end
