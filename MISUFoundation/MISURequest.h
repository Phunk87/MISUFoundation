//
//  MISURequest.h
//  MISUFoundation
//
//  Created by 0day on 12-8-28.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    HttpMethodUnknow = 0,
    HttpMethodGET,
    HttpMethodPOST,
    HttpMethodDELETE,
    HttpMethodPUT,
    HttpMethodHEAD,
} HttpMethod;

typedef void (^MISURequestCompletionBlock)(NSURLResponse *response, NSData *data, NSError *error);

@interface MISURequest : NSObject

+ (void)sendAsynchronousWithHttpMethod:(HttpMethod)mehtod
                                   URL:(NSString *)url
                      httpHeaderFields:(NSMutableDictionary *)headerFields
                                params:(NSMutableDictionary *)params
                     completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

// GET
+ (void)getWithURL:(NSString *)url
  httpHeaderFields:(NSMutableDictionary *)headerFields
            params:(NSMutableDictionary *)params
 completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

// POST
+ (void)postWithURL:(NSString *)url
   httpHeaderFields:(NSMutableDictionary *)headerFields
             params:(NSMutableDictionary *)params
  completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

// DELETE
+ (void)deleteWithURL:(NSString *)url
     httpHeaderFields:(NSMutableDictionary *)headerFields
               params:(NSMutableDictionary *)params
    completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

// PUT
+ (void)putWithURL:(NSString *)url
  httpHeaderFields:(NSMutableDictionary *)headerFields
            params:(NSMutableDictionary *)params
 completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

// HEAD
+ (void)headWithURL:(NSString *)url
   httpHeaderFields:(NSMutableDictionary *)headerFields
             params:(NSMutableDictionary *)params
  completionHandler:(MISURequestCompletionBlock)handler NS_AVAILABLE(10_6, 4_0);

@end
