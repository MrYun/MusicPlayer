//
//  ZYPlayingMusicViewController.m
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYPlayingMusicViewController.h"
#import "UIView+AdjustFrame.h"
#import "ZYMusics.h"
#import "ZYMusicTools.h"
#import "ZYAudioPlay.h"


@interface ZYPlayingMusicViewController ()
/// 记录正在播放的音乐
@property (nonatomic, strong) ZYMusics *playingMusic;
/// 歌手背景
@property (weak, nonatomic) IBOutlet UIImageView *sigerIcon;
/// 音乐名字
@property (weak, nonatomic) IBOutlet UILabel *musicName;
/// 歌手名字
@property (weak, nonatomic) IBOutlet UILabel *sigerName;

- (IBAction)exit;

@end

@implementation ZYPlayingMusicViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

}


#pragma mark - 对音乐播放的控制
- (void)startPlayingMusic{
    
    //拿到正在播放的音乐
    ZYMusics *playingMusic = [ZYMusicTools playingMusic];
    
    if (playingMusic != self.playingMusic) {
        self.playingMusic = playingMusic;
        
        //设置界面的数据
        self.sigerIcon.image = [UIImage imageNamed:playingMusic.icon];
        self.sigerName.text = playingMusic.singer;
        self.musicName.text = playingMusic.name;
        
        //播放音乐
        [ZYAudioPlay startPlayMusic:self.playingMusic.filename];
    }
}


/// 停止播放音乐
 
- (void)stopPlayingMusic {
    // 1.清除界面数据
    self.musicName.text = nil;
    self.sigerName.text = nil;
    self.sigerIcon.image = [UIImage imageNamed:@"play_cover_pic_bg"];
    [ZYAudioPlay stopPlayMusic:self.playingMusic.filename];
    
}


#pragma mark - 对控制器的操作

/// 显示控制器
- (void)show {
    
    // 0.判断播放音乐是否发生改变
    if (self.playingMusic && self.playingMusic != [ZYMusicTools playingMusic]) {
        [self stopPlayingMusic];
    }
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
        //开始播放音乐
        [self startPlayingMusic];
    }];
}


/// 退出控制器
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
