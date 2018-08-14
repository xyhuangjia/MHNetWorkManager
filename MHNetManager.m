//
//  MHNetManager.m
//  BaseExample
//
//  Created by huangj on 2018/8/13.
//  Copyright © 2018年 中恒云能源. All rights reserved.
//

#import "MHNetManager.h"
#import <AFNetworking/AFNetworking.h>

@interface MHNetManager()
{
    AFHTTPSessionManager * manager;
}
@end

@implementation MHNetManager

/**
 POST请求
 
 @param path 接口名
 @param params 参数
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
+ (void)postRequestWithPath:(NSString *)path
                     Params:(NSDictionary *)params
               SuccessBlock:(SuccessBlock)successBlock
               FailureBlock:(FailureBlock)failureBlock{
    
}

@end
