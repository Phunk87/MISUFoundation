//
//  MISUJSONSerialization.m
//  MISUFoundation
//
//  Created by 0day on 12-11-21.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import "MISUJSONSerialization.h"

@implementation MISUJSONSerialization

+ (NSData *)dataWithJSONObject:(id)obj error:(NSError **)error {
    Class JSONClass = NSClassFromString(@"NSJSONSerialization");
    if (JSONClass) {
        // ios >= 5.0
        return [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:error];
    } else {
        // ios < 5.0
        // TODO: 5.0以下版本支持
        return nil;
    }
}

+ (id)JSONObjectWithData:(NSData *)data error:(NSError **)error {
    Class JSONClass = NSClassFromString(@"NSJSONSerialization");
    if (JSONClass) {
        // ios >= 5.0
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:error];
    } else {
        // ios < 5.0
        // TODO: 5.0以下版本支持
        return nil;
    }
}

@end
