//
//  LSToolsTimerViewController.m
//  LSKit
//
//  Created by WangBiao on 2017/7/25.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSToolsTimerViewController.h"
#import "LSTools.h"

@interface LSToolsTimerViewController ()

@end

@implementation LSToolsTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    __block NSInteger index = 0;
    [[LSTools sharedTools] initGCDTimerWithIntervals:3.f andCallback:^{
        NSLog(@"%ld", index++);
    }];
    [[LSTools sharedTools] startGCDTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
