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

@implementation MISURequest

+ (void)sendAsynchronousWithHttpMethod:(HttpMethod)mehtod
                                   URL:(NSString *)url
                                params:(NSMutableDictionary *)params
                     completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    // 创建请求队列
    static dispatch_queue_t s_request_queue = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_request_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    });
    
    // rest化
    NSString *restString = [params restRepresentation];
    
    // 区分请求
    switch (mehtod) {
        case HttpMethodGET:
        {
            NSURL *fullURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, restString]];
            
            NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
            request.HTTPMethod = @"GET";
            
            dispatch_async(s_request_queue, ^{
                NSURLResponse *response = nil;
                NSError *error = nil;
                NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:&response
                                                                 error:&error];
                handler(response, data, error);
            });
        }
            break;
        case HttpMethodPOST:
        {
            NSURL *fullURL = [NSURL URLWithString:url];
            NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
            request.HTTPMethod = @"POST";
            
            NSData *bodyData = [restString dataUsingEncoding:NSUTF8StringEncoding];
            request.HTTPBody = bodyData;
            
            dispatch_async(s_request_queue, ^{
                NSURLResponse *response = nil;
                NSError *error = nil;
                NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:&response
                                                                 error:&error];
                handler(response, data, error);
            });
        }
            break;
        case HttpMethodDELETE:
        {
            NSURL *fullURL = [NSURL URLWithString:url];
            NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
            request.HTTPMethod = @"DELETE";
            
            NSData *bodyData = [restString dataUsingEncoding:NSUTF8StringEncoding];
            request.HTTPBody = bodyData;
            
            dispatch_async(s_request_queue, ^{
                NSURLResponse *response = nil;
                NSError *error = nil;
                NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:&response
                                                                 error:&error];
                handler(response, data, error);
            });
        }
            break;
        case HttpMethodPUT:
        {
            NSURL *fullURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", url, restString]];
            
            NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] initWithURL:fullURL] MISUAutorelease];
            request.HTTPMethod = @"PUT";
            
            dispatch_async(s_request_queue, ^{
                NSURLResponse *response = nil;
                NSError *error = nil;
                NSData *data = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:&response
                                                                 error:&error];
                handler(response, data, error);
            });
        }
            break;
        case HttpMethodUnknow:
        default:
            break;
    }
}

@end
