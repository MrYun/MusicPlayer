//
//  ZYMusicTools.h
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZYMusics;

@interface ZYMusicTools : NSObject

/// 获取所有音乐的数组
+ (NSArray *)musics;

/// 获取正在播放的音乐
+ (ZYMusics *)playingMusic;

/// 设置正在播放的音乐
+ (void)setPlayingMusic:(ZYMusics *)playingMusic;

///播放下一首音乐
+ (ZYMusics *)nextMusic;

/// 播放上一首音乐
+ (ZYMusics *)previousMusic;

@end
