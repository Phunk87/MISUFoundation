//
//  NSString+Crypto.m
//  MISUFoundation
//
//  Created by Oneday on 12-11-23.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import "NSString+Crypto.h"
#import "MISUMemory.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Crypto)

- (NSString *)md5Value {
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *tempString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [tempString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    NSString *outputString = [tempString copy];
    [tempString MISURelease];
    [outputString MISUAutorelease];
    
    return outputString;
}

@end
