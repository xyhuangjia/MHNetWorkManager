//
//  MHNetManager.h
//  BaseExample
//
//  Created by huangj on 2018/8/13.
//  Copyright © 2018年 中恒云能源. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSDictionary * responseJSON);
typedef void(^FailureBlock)(NSError * error);

@interface MHNetManager : NSObject


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
               FailureBlock:(FailureBlock)failureBlock;

@end
