//
//  MHViewController.m
//  MHNetWorkManager
//
//  Created by xyhuangjia@foxmail.com on 08/13/2018.
//  Copyright (c) 2018 xyhuangjia@foxmail.com. All rights reserved.
//

#import "MHViewController.h"
#import <MHNetWorkManager/MHNetWorkManager.h>

@interface MHViewController ()

@end

@implementation MHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [MHNetWorkManager postRequestWithPath:@"/data/forecast"
//                                   Params:nil
//                             SuccessBlock:^(NSDictionary *responseJSON) {
//
//    } FailureBlock:^(NSError *error) {
//
//    }];
    [MHNetWorkManager postRequestWithPath:@"/data/forecast"
                                   Params:nil
                                 FilePath:@"testresponse.json"
                             SuccessBlock:^(NSDictionary *responseJSON) {
        
    } FailureBlock:^(NSError *error) {
        
    }];
}


@end
