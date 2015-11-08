//
//  ZYAudioPlay.h
//  录制和音乐播放
//
//  Created by 赵云 on 15/10/31.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ZYAudioPlay : UIRefreshControl

/// 开始播放音乐
+ (AVAudioPlayer *)startPlayMusic:(NSString *)musicName;

/// 暂停播放音乐
+ (void)pausePlayMusic:(NSString *)musicName;

/// 停止播放音乐
+ (void)stopPlayMusic: (NSString *)musicName;


/// 播放音效
+ (void)playSound: (NSString *)soundName;

/// 销毁音效
+ (void)disposSoundWithName:(NSString *)soundName;

@end
