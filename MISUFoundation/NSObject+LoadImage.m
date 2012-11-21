//
//  NSObject+LoadImage.m
//  MISUFoundation
//
//  Created by 0day on 12-9-4.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#import "NSObject+LoadImage.h"
#import "NSDictionary+RestRepresentation.h"

@implementation NSObject (LoadImage)

- (void)loadImageInBackgroundWithURL:(NSURL *)url completionHandler:(void (^)(NSData *))handler {
    if (nil == handler || nil == url)
        return;
    
    dispatch_queue_t download_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(download_queue, ^{
        if (url) {
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            handler(imageData);
        }
    });
}

@end
