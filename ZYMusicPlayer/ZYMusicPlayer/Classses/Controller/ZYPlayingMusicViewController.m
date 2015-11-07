//
//  ZYPlayingMusicViewController.m
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYPlayingMusicViewController.h"
#import "UIView+AdjustFrame.h"


@interface ZYPlayingMusicViewController ()

- (IBAction)exit;

@end

@implementation ZYPlayingMusicViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

#pragma mark - 对控制器的操作

/**
 *  显示控制器
 */
- (void)show {
    // 1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.userInteractionEnabled = NO;
    
    // 2.设置view的frame
    self.view.frame = window.bounds;
    
    // 3.将自身的view添加到window上
    [window addSubview:self.view];
    
    // 4.给self.view添加动画
    self.view.y = self.view.height;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
    }];
}

/**
 *  退出控制器
 */
- (IBAction)exit {
    
    // 1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.userInteractionEnabled = NO;
    
    // 2.执行动画退出
    [UIView animateWithDuration:1.0 animations:^{
        self.view.y = self.view.height;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
    }];
}
@end
