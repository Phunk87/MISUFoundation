//
//  NSObject+LoadImage.h
//  MISUFoundation
//
//  Created by 0day on 12-9-4.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @category        NSObject (LoadImage)
 * @discussion      对NSObject的扩展，包含该Category后可以让任何对象具有异步加载imageData的能力
 */
@interface NSObject (LoadImage)

/*!    
 * @method          loadImageInBackgroundWithURL:completionHandler:
 * @abstract        加载图片并返回图片的data
 * @discussion      可以在任意线程调用该方法,返回的block会在下载线程执行,所以要执行UI相关的内容需要在block内指定在主线程执行
 * @param           url     图片的url
 * @param           handler 下载完后的block
 */
- (void)loadImageInBackgroundWithURL:(NSURL *)url completionHandler:(void (^)(NSData *imageData))handler NS_AVAILABLE(10_6, 4_0);

@end
