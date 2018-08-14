//
//  MHNetWorkManager.h
//  AFNetworking
//
//  Created by huangj on 2018/8/14.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSDictionary * responseJSON);
typedef void(^FailureBlock)(NSError * error);

@interface MHNetWorkManager : NSObject

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

/**
 <#Description#>

 @param path <#path description#>
 @param params <#params description#>
 @param filePath <#filePath description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 */
+ (void)postRequestWithPath:(NSString *)path
                     Params:(NSDictionary *)params
                   FilePath:(NSString *)filePath
               SuccessBlock:(SuccessBlock)successBlock
               FailureBlock:(FailureBlock)failureBlock;
@end
