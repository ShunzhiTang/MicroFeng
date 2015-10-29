//
//  TSZTabBarViewController.m
//  MicroFeng
//
//  Created by Tsz on 15/10/29.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZTabBarViewController.h"

#import "TSZHomeTableViewController.h"
@interface TSZTabBarViewController ()

@end

@implementation TSZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //先设置一个颜色
    self.view.backgroundColor = [UIColor blueColor];
    
    //设置子控制器
    TSZHomeTableViewController *homeVc = [[TSZHomeTableViewController alloc]init];
    homeVc.title = @"首页";
    self.viewControllers = @[homeVc];
    
}

//需要给TarBar控制器设置子控制器


@end
