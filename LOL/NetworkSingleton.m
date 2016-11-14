//
//  NetworkSingleton.m
//  LOL
//
//  Created by Kean on 16/7/12.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "NetworkSingleton.h"

@implementation NetworkSingleton

+ (NetworkSingleton *)sharedManager {

    static NetworkSingleton *sharedNetworkSingleton = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworkSingleton = [[NetworkSingleton alloc] init];
    });

    return sharedNetworkSingleton;

}
/*
- (AFHTTPSessionManager *)baseHtppRequest {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 每隔5000 = 5秒 执行一次
    [manager.requestSerializer setTimeoutInterval:20];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"text/html",@"application/javascript",@"application/json", nil];
    
    return manager;

}
 */

- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error))failure {

    AFHTTPSessionManager *manager = [NetworkSingleton sharedManager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"text/html",@"application/javascript",@"application/json", nil];
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    
    }];

}





@end
