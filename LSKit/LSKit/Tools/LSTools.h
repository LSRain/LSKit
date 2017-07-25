//
//  LSTools.h
//  LSKit
//
//  Created by WangBiao on 2017/7/25.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
