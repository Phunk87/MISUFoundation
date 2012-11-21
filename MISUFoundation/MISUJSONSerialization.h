//
//  MISUJSONSerialization.h
//  MISUFoundation
//
//  Created by 0day on 12-11-21.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MISUJSONSerialization : NSObject

+ (NSData *)dataWithJSONObject:(id)obj error:(NSError **)error;
+ (id)JSONObjectWithData:(NSData *)data error:(NSError **)error;

@end
