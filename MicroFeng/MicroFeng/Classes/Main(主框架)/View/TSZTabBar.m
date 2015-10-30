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
//定义一个背景图片
@property (nonatomic , weak)UIImageView *backImage;

@end

@implementation TSZTabBar

//布局子控件
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景image
        [self addBackground];
        
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
    
    //设置btn的点击事件
    [btn addTarget:self action:@selector(clickSend) forControlEvents:UIControlEventTouchUpInside];
    
    //设置frame ，按钮的大小和背景图片的大小一致
    
    btn.size = btn.currentBackgroundImage.size;
    
    [self addSubview:btn];
    
    //使用它
    self.plusBtn = btn ;
}

//单击的方法
- (void)clickSend{
    
    //实现动画效果
    
    [UIView animateWithDuration:0.5 animations:^{
        self.backImage.x = self.plusBtn.x;
    }];
    
    //通知代理 ，代理去实现
    if ([self.delegate respondsToSelector:@selector(tabbarDidClickSendButton:)]) {
        [self.delegate tabbarDidClickSendButton:self];
    }
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
    
    //设置背景图片的frame
    self.backImage.frame = CGRectMake(0, 0, tabW, self.bounds.size.height);
    
    
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

#pragma - mark 添加按钮背景图片
- (void)addBackground
{
    // 添加白色图片
    UIImageView *backGroundImage = [[UIImageView alloc] init];
    backGroundImage.image = [UIImage imageNamed:@"toolBar_shade"];
    self.backImage = backGroundImage;
    [self addSubview:backGroundImage];
}


#pragma mark 画出背景
- (void)drawRect:(CGRect)rect{
    UIImage *image = [UIImage imageNamed:@"tabBar_back"];
    [image drawInRect:rect];
}

@end
