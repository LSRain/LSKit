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


- (void)btnClickAction:(UIButton *)sender{
    [[LSTools sharedTools].userCache removeAllObjects];
    
    NSLog(@"red Cache Data(New): %@", [[LSTools sharedTools].userCache objectForKey:@"kTestKey"]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // Cache
    [[LSTools sharedTools].userCache setObject:@[
                                                 @"Test Data 01",
                                                 @"Test Data 02",
                                                 @"Test Data 03"
                                                 ]
                                        forKey:@"kTestKey"];
    NSLog(@"red Cache Data: %@", [[LSTools sharedTools].userCache objectForKey:@"kTestKey"]);
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 124, 44)];
    [clearBtn setTitle:@"clear Cache" forState:UIControlStateNormal];
    clearBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:clearBtn];
    [clearBtn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
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
