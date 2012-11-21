//
//  NSObject+LoadImage.h
//  MISUFoundation
//
//  Created by 0day on 12-9-4.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LoadImage)

- (void)loadImageInBackgroundWithURL:(NSURL *)url completionHandler:(void (^)(NSData *imageData))handler NS_AVAILABLE(10_6, 4_0);

@end
