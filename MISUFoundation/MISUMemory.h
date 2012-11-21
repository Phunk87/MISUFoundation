//
//  MISUMemory.h
//  MISUFoundation
//
//  Created by 0day on 12-11-21.
//  Copyright (c) 2012年 0day. All rights reserved.
//

#ifndef WeikanHD_MISUMemory_h
#define WeikanHD_MISUMemory_h

/**
 * 匹配arc
 */
#if __has_feature(objc_arc)
    #define MISURetain
    #define MISUAutorelease
    #define MISURelease
#else
    #define MISURetain  retain
    #define MISUAutorelease autorelease
    #define MISURelease release
#endif

/**
 * 内存管理
 */
#define MISUSafeRelease(inObj) id obj = (inObj);if (obj) {[obj MISURelease];} obj = nil

#endif
