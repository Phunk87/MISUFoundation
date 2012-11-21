//
//  MISURequest.m
//  MISUFoundation
//
//  Created by 0day on 12-8-28.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import "MISURequest.h"
#import "NSDictionary+RestRepresentation.h"
#import "MISUMemory.h"

@interface MISURequest ()
+ (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(MISURequestCompletionBlock)handler;
@end

@implementation MISURequest

#pragma mark - public
+ (void)sendAsynchronousWithHttpMethod:(HttpMethod)mehtod
                                   URL:(NSString *)url
                                params:(NSMutableDictionary *)params
                     completionHandler:(MISURequestCompletionBlock)handler {
    
    // 区分请求
    switch (mehtod) {
        case HttpMethodGET:
            [self getWithURL:url params:params completionHandler:handler];
            break;
        case HttpMethodPOST:
            [self postWithURL:url params:params completionHandler:handler];
            break;
        case HttpMethodDELETE:
            [self deleteWithURL:url params:params completionHandler:handler];
            break;
        case HttpMethodPUT:
            [self putWithURL:url params:params completionHandler:handler];
            break;
        case HttpMethodUnknow:
        default:
            break;
    }
}

+ (void)getWithURL:(NSString *)url
            params:(NSMutableDictionary *)params
 completionHandler:(MISURequestCompletionBlock)handler {
    // rest化
    NSString *restString = [params restRepresentation];
    NSURL *fullURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, restString]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
    request.HTTPMethod = @"GET";
    
    [self sendRequest:request withCompletionHandler:handler];
}

+ (void)postWithURL:(NSString *)url
             params:(NSMutableDictionary *)params
  completionHandler:(MISURequestCompletionBlock)handler {
    // rest化
    NSString *restString = [params restRepresentation];
    NSURL *fullURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
    request.HTTPMethod = @"POST";
    
    NSData *bodyData = [restString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = bodyData;
    
    [self sendRequest:request withCompletionHandler:handler];
}

+ (void)deleteWithURL:(NSString *)url
               params:(NSMutableDictionary *)params
    completionHandler:(MISURequestCompletionBlock)handler {
    // rest化
    NSString *restString = [params restRepresentation];
    NSURL *fullURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
    request.HTTPMethod = @"DELETE";
    
    NSData *bodyData = [restString dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = bodyData;
    
    [self sendRequest:request withCompletionHandler:handler];
}

+ (void)putWithURL:(NSString *)url
            params:(NSMutableDictionary *)params
 completionHandler:(MISURequestCompletionBlock)handler {
    // rest化
    NSString *restString = [params restRepresentation];
    NSURL *fullURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, restString]];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
    request.HTTPMethod = @"PUT";
    
    [self sendRequest:request withCompletionHandler:handler];
}

#pragma mark - 扩展
+ (void)sendRequest:(NSURLRequest *)request withCompletionHandler:(MISURequestCompletionBlock)handler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        handler(response, data, error);
    });
}

@end
