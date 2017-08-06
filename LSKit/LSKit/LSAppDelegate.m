//
//  LSAppDelegate.m
//  LSKit
//
//  Created by WangBiao on 2017/7/25.
//  Copyright © 2017年 LSRain. All rights reserved.
//

// 以下代码参考自`YYKit`: https://github.com/ibireme/YYKit

#import "LSAppDelegate.h"
#import "LSRootViewController.h"

# pragma mark - Fix the navigation bar height when hide status bar.

@interface LSNavBar : UINavigationBar

@end

@implementation LSNavBar {
    CGSize _previousSize;
}


- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:size];
    if ([UIApplication sharedApplication].statusBarHidden) {
        size.height = 64;
    }
    return size;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!CGSizeEqualToSize(self.bounds.size, _previousSize)) {
        _previousSize = self.bounds.size;
        [self.layer removeAllAnimations];
        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeAllAnimations)];
    }
}

@end

# pragma mark - NavController

@interface LSNavController : UINavigationController

@end

@implementation LSNavController


- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end

@implementation LSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    LSRootViewController *root = [LSRootViewController new];
    LSNavController *nav = [[LSNavController alloc] initWithNavigationBarClass:[LSNavBar class] toolbarClass:[UIToolbar class]];
    if ([nav respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        nav.automaticallyAdjustsScrollViewInsets = NO;
    }
    [nav pushViewController:root animated:NO];
    
    self.rootViewController = nav;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.rootViewController;
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
