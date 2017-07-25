//
//  LSTools.m
//  LSKit
//
//  Created by WangBiao on 2017/7/25.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSTools.h"

@interface LSTools ()

/// GCD Timer - Please use `strong` decorations, otherwise the object will be destroyed
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation LSTools

+ (instancetype)sharedTools {
    static LSTools *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LSTools alloc] init];
    });
    return instance;
}

#pragma mark - 创建一个GCD定时器

- (void)initGCDTimerWithIntervals:(CGFloat)intervalsTime andCallback:(LSGCDTimerCallBack)callBack{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), intervalsTime * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (callBack) {
                callBack();
            }
        });
    });
    self.timer = timer;
}

- (void)canelGCDTimer{
    dispatch_source_cancel(self.timer);
}

- (void)startGCDTimer{
    dispatch_resume(self.timer);
}

@end
