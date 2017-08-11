//
//  MD5Util.m
//  QLKit
//
//  Created by Sim on 12-9-3.
//  Copyright (c) 2012年 3gtv.net. All rights reserved.
//

#import "MD5Util.h"
#import <CommonCrypto/CommonDigest.h>


@implementation MD5Util

+(NSString*)md5:(NSString *)str
{
    if(str == nil)
        return nil;
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+(NSString *)md5_16_String:(NSString *)str{
    
    NSString *md5_32_String=[self md5:str];
//    NSString *result = [md5_32_String substringFromIndex:8];    return result;
    NSString *result = [[md5_32_String substringToIndex:24] substringFromIndex:8];    return result;
}

+(NSString *)md5WithData:(NSData *)data
{
    if (!data) {
        return nil;
    }
    const void *cDt = [data bytes];
    unsigned long len = data.length;
    unsigned char result[16];
    CC_MD5(cDt, (CC_LONG)len, result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
