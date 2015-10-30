//
//  TSZTabBar.m
//  MicroFeng
//
//  Created by Tsz on 15/10/29.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import "TSZTabBar.h"
#import "MBProgressHUD.h"
#import "UIView+Extension.h"

@interface TSZTabBar ()

@property (nonatomic ,weak) UIButton *plusBtn;
@end


@implementation TSZTabBar

//布局子控件
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置所需要的button
        [self setupBtn];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         //设置所需要的button
        [self setupBtn];
    }
    return self;
}

#pragma mark: 实现所需要的button
- (void)setupBtn{
    //添加一个按钮到tabBar上
    UIButton *btn = [[UIButton alloc]init];
    
    //设置背景颜色
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
     [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    //设置frame ，按钮的大小和背景图片的大小一致
    
    btn.size = btn.currentBackgroundImage.size;
    
    [self addSubview:btn];
    
    //使用它
    self.plusBtn = btn ;
}

#pragma mark:layoutSubviews  布局子控件必须这样写

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //循环添加按钮
    //1、设置发送按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    
    self.plusBtn.centerY = self.height * 0.5;
    //设置其他位置的尺寸
    CGFloat tabW = self.width  / 5 ;
    
    //当前tab的索引
    CGFloat tabIndex = 0;
    
    for (UIView *child  in  self.subviews) {
        //判断 UITabBarButton是TabBar上 的 按钮
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            //设置宽度
            child.width = tabW;
            
            //设置x 的坐标
            child.x = tabIndex * tabW ;
            //增加索引
            tabIndex++;
            //中间的发送按钮不是UITabBarButton  是我们自定义的
            if (tabIndex  == 2){
                tabIndex++;
            }
        }
    }
}


@end
