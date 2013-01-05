//
//  NSDictionary+RestRepresentation.h
//  MISUFoundation
//
//  Created by 0day on 12-8-29.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @category    NSDictionary (RestRepresentation)
 * @discussion  字典的扩展
 */
@interface NSDictionary (RestRepresentation)

/*!
 * @method      restRepresentation
 * @abstract    返回字典的rest格式
 * @discussion  将字典以key=value的形式拼接,每个键值对以&连接,最终返回一个rest字符串
 * @return      返回拼接好的rest字符串,如果字典内容为空便返回nil
 */
- (NSString *)restRepresentation;

@end
