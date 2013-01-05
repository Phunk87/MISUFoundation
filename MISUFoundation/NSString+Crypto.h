//
//  NSString+Crypto.h
//  MISUFoundation
//
//  Created by Oneday on 12-11-23.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @category        NSString (Crypto)
 * @discussion      对NSString扩展，加密字符串
 */
@interface NSString (Crypto)

/*!
 * @method      md5Value
 * @abstract    对字符串做md5加密
 * @discussion  如果receiver为nil或者字符串长度为0，则返回nil
 * @return      经过md5加密的字符串
 */
- (NSString *)md5Value;

@end
