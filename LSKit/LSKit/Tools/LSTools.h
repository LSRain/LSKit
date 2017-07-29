//
//  LSTools.h
//  LSKit
//
//  Created by WangBiao on 2017/7/25.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import <UIKit/UIKit.h>
/* third Libs: https://github.com/ibireme/YYCache */
#import "YYCache.h"

typedef void(^LSGCDTimerCallBack)();

@interface LSTools : NSObject

+ (instancetype)sharedTools;

/**
 Create a GCD timer

 @param intervalsTime intervals(s)
 @param callBack Implementation method
 */
- (void)initGCDTimerWithIntervals:(CGFloat)intervalsTime andCallback:(LSGCDTimerCallBack)callBack;

/**
 Cancel the timer
 */
- (void)canelGCDTimer;

/**
 Turn on the timer
 */
- (void)startGCDTimer;

/**
 Cache
 Sorry, here you need to import a third Libs frame
 You can use cocoapod, or drag it directly into this frame to your project
 cocoapod:
 `pod search YYCache` then pod to your project
 drag:
 `https://github.com/ibireme/YYCache` Download the item and drag it in
 
 In the current project, you have dragged a copy, if you want to modify the version in use, you can replace it
 */
@property (nonatomic, strong) YYCache *userCache;

@end
