//
//  UploadParam.h
//  PaPaPa
//
//  Created by CHT on 2017/8/4.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadParam : NSObject
//图片的二进制数据
@property (nonatomic,strong) NSData *data;
//服务器对应的参数名称
@property (nonatomic,copy) NSString *name;
//文件的名称(上传到服务器,服务器保存的文件名)
@property (nonatomic, copy) NSString *filename;
//文件的MIME(image/png,image/jpg)
@property (nonatomic,copy) NSString *mimeType;


@end
