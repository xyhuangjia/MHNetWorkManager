//
//  MHNetWorkManager.m
//  AFNetworking
//
//  Created by huangj on 2018/8/14.
//

#import "MHNetWorkManager.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import <AFNetworking/AFNetworking.h>


typedef NS_ENUM(NSInteger,MHRequestType) {
    MHRequestTypeGET,
    MHRequestTypePOST
};

@interface MHNetWorkManager()
@end
@implementation MHNetWorkManager



//MARK: GET

//MARK: POST

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
    [self mockPostRequestWithPath:path
                      RequestType:MHRequestTypeGET
                           IsMock:YES
                         FilePath:nil
                           Params:params
                     SuccessBlock:successBlock
                     FailureBlock:failureBlock];
}

+ (void)postRequestWithPath:(NSString *)path
                     Params:(NSDictionary *)params
                   FilePath:(NSString *)filePath
               SuccessBlock:(SuccessBlock)successBlock
               FailureBlock:(FailureBlock)failureBlock{
    [self mockPostRequestWithPath:path
                      RequestType:MHRequestTypeGET
                           IsMock:YES
                         FilePath:filePath
                           Params:params
                     SuccessBlock:successBlock
                     FailureBlock:failureBlock];
}


//MARK: Private method

+ (void)mockPostRequestWithPath:(NSString *)path
                    RequestType:(MHRequestType)requestType
                         IsMock:(BOOL)isMock
                       FilePath:(NSString *)filePath
                         Params:(NSDictionary *)params
                   SuccessBlock:(SuccessBlock)successBlock
                   FailureBlock:(FailureBlock)failureBlock{
    if (isMock) {
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * _Nonnull request) {
            return [request.URL.path containsString:path];
        } withStubResponse:^OHHTTPStubsResponse * _Nonnull(NSURLRequest * _Nonnull request) {
            NSString *fixture = OHPathForFileInBundle(filePath, [NSBundle mainBundle]);
            return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                    statusCode:200
                                                       headers:@{@"Content-Type":@"application/json"}];
        }];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
//    NSString *token = [HXDataSessionHelper getToken];
//    [manager.requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
//    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"User-Agent"];
    if (requestType == MHRequestTypeGET) {
        [manager GET:@"http://mobile.weather.com.cn/data/forecast/101010100.html?_=1381891660081"
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@", responseObject);
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            failureBlock(error);
        }];
    }else{
        [manager POST:path
           parameters:params
             progress:^(NSProgress * _Nonnull uploadProgress) {
                 
             }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  successBlock(responseObject);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  failureBlock(error);
              }];
    }
    
    
    
}
@end
