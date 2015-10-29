//
//  TSZTabBarViewController.m
//  MicroFeng
//
//  Created by Tsz on 15/10/29.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZTabBarViewController.h"
#import "TSZHomeTableViewController.h"
#import "TSZNavigationController.h"
#import "TSZDiscoverTableViewController.h"
#import "TSZMessageTableViewController.h"
#import "TSZMineTableViewController.h"

//宏定义 当前的IOS 版本
#define  IOS7 (  [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//宏定义一个RGB的颜色
#define TSZColor(r,g,b) [UIColor colorWithRed:(r)/255.0  green:(g)/255.0 blue:(b)/255.0 alpha: 1.0]


@interface TSZTabBarViewController ()

//设置一个button的属性
@property (nonatomic , strong)UIButton *centerButton;

@end

@implementation TSZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置子控制器
    [self setChilderController];
}

/**
 * 子视图布置完成
 */
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self customBtn];
}
#pragma mark --需要给TarBar控制器设置子控制器

-(void)setChilderController{
    
   //1、第一个控制器
    TSZHomeTableViewController *homeVc = [[TSZHomeTableViewController alloc]init];
    [self controller:homeVc WithTitle:@"首页" image:@"tabbar_home" andSeleted:@"tabbar_home_highlighted"];
    
    //2、第二个控制器
    TSZMessageTableViewController *messageVc = [[TSZMessageTableViewController alloc] init];
    [self controller:messageVc WithTitle:@"消息" image:@"tabbar_message_center" andSeleted:@"tabbar_message_center_highlighted"];
    
    //添加一个空的 控制器 ，撑开这个范围
    UIViewController *vc = [[UIViewController alloc]init];
    [self addChildViewController:vc];
    
    //3、第三个控制器
    TSZDiscoverTableViewController *discoverVc = [[TSZDiscoverTableViewController alloc] init];
    [self controller:discoverVc WithTitle:@"发现" image:@"tabbar_discover" andSeleted:@"tabbar_discover_highlighted"];
    
    //4、第四个控制器
    
    TSZMineTableViewController *mineVc = [[TSZMineTableViewController alloc]init];
    
    [self controller:mineVc WithTitle:@"我的信息" image:@"tabbar_profile" andSeleted:@"tabbar_profile_highlighted"];
    
}

#pragma mark: 设置子控制器的图片，文字 和  字体等等

- (void )controller:(UIViewController *)controller  WithTitle:(NSString *)title image:(NSString *)image  andSeleted:(NSString *)selectedImage {

    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.title = title;
    
    //设置 子控制器的图片 ,当大于7.0 的时间需要处理渲染
    if (IOS7){
        controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else {
        controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    //设置一下文字的样式 ,使用富文本属性  ,属性文本
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    textAttrs[NSForegroundColorAttributeName] = TSZColor(123, 123, 123);
    
    //选择文本的颜色
    NSMutableDictionary *selectTextAttr = [NSMutableDictionary dictionary];
    selectTextAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [controller.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:selectTextAttr forState:UIControlStateSelected];
    
    //包装Nav控制器
    TSZNavigationController *nav = [[TSZNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
}

#pragma mark 创建一个button放在对应的位置上

- (void)customBtn{
    
    if ( _centerButton == nil) {
        _centerButton = [[UIButton alloc]init];
    }
    
    //长度
    CGFloat w = self.tabBar.bounds.size.width / self.childViewControllers.count;
    CGRect rect = CGRectMake(0, 0, w, self.tabBar.bounds.size.height);
    
    //设置frmae
    _centerButton.frame = CGRectOffset(rect, 2 * w, 0);
    [_centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
     [_centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    //设置背景图片
    [_centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
     [_centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    //设置一个监听事件
    [_centerButton addTarget:self action:@selector(clickAdd) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:_centerButton];
}

- (void)clickAdd{
    NSLog(@"滴啊你了我怕");
}

@end
