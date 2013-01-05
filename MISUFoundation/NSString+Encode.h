//
//  NSString+Encode.h
//  WeikanAPI
//
//  Created by Oneday on 12-12-27.
//  Copyright (c) 2012年 kingsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encode)

/*!
 * @method      base64StringWithData:
 * @abstract    对Data做Base64编码，并返回对应的一个NSString
 * @discussion  如果data为nil或者data长度为0，则返回nil
 * @return      Base64编码的NSString
 */
+ (NSString *)base64StringWithData:(NSData *)data;

- (NSString *)encodeBase64;
- (NSString *)encodeBase64UsingEncoding:(NSStringEncoding)encoding;

- (NSString *)decodeBase64;

@end
