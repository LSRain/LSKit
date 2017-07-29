//
//  LSToolsCacheViewController.m
//  LSKit
//
//  Created by WangBiao on 2017/7/29.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSToolsCacheViewController.h"
#import "LSTools.h"

@interface LSToolsCacheViewController ()

@end

@implementation LSToolsCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    // Cache
    [[LSTools sharedTools].userCache setObject:@[
                                                 @"Test Data 01",
                                                 @"Test Data 02",
                                                 @"Test Data 03"
                                                 ]
                                        forKey:@"kTestKey"];
    NSLog(@"red Cache Data: %@", [[LSTools sharedTools].userCache objectForKey:@"kTestKey"]);
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
