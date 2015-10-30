//
//  TSZSendMicroblogController.m
//  MicroFeng
//
//  Created by Tsz on 15/10/29.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZSendMicroblogController.h"

@interface TSZSendMicroblogController ()

@end

@implementation TSZSendMicroblogController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setNavgation];
    
}

#pragma mark 设置导航栏
- (void)setNavgation{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(sendCompose)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

- (void)sendCompose{
    NSLog(@"发送微博");
}

- (void)cancel{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
