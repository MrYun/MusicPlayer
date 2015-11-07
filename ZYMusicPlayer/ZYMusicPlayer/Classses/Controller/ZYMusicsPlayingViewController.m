//
//  ZYMusicsPlayingViewController.m
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/5.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYMusicsPlayingViewController.h"
#import "UIView+AdjustFrame.h"

@interface ZYMusicsPlayingViewController ()

@end

@implementation ZYMusicsPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)show{
    
    //1.拿到window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.userInteractionEnabled = NO;
    //2.设置view的frame
    self.view.frame = window.bounds;
    //3,把view添加到window上
    [window addSubview:self.view];
    //4.设置view的动画
    self.view.y = self.view.height;
    [UIView animateWithDuration:3.0 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
    }];
    
}

@end
