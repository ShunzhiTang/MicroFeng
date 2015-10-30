//
//  TSZTabBar.h
//  MicroFeng
//
//  Created by Tsz on 15/10/29.
//  Copyright © 2015年 Tsz. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义一个协议
#pragma mark: 因为TSZTabBar继承自UITabBar，所以TSZTabBar的代理，也必须实现UITabBar的代理协议
@class TSZTabBar;
@protocol TSZTabBarDelegate <UITabBarDelegate>

@optional
- (void)tabbarDidClickSendButton:(TSZTabBar *)tabBer;
@end

@interface TSZTabBar : UITabBar

@property (nonatomic , weak) id <TSZTabBarDelegate> delegate;
@end
