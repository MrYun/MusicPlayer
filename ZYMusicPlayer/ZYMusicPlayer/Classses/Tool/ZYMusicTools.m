//
//  ZYMusicTools.m
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/7.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYMusicTools.h"
#import "MJExtension.h"
#import "ZYMusics.h"


static NSArray *_musics;
static ZYMusics *_playingMusic;

@implementation ZYMusicTools
/// 当第一次调用该类的时候调用
+ (void)initialize{
    _musics = [ZYMusics objectArrayWithFilename:@"Musics.plist"];
}

/// 获取所有音乐的数组
+ (NSArray *)musics{
    
    return _musics;
    
}

/// 获取正在播放的音乐
+ (ZYMusics *)playingMusic{
   
    return _playingMusic;
}

/// 设置正在播放的音乐
+ (void)setPlayingMusic:(ZYMusics *)playingMusic{
    assert(playingMusic);
    _playingMusic = playingMusic;
    
}

///播放下一首音乐
+ (ZYMusics *)nextMusic{
    //获取当前正在播放的音乐
    NSInteger currentIndex = [_musics indexOfObject:_playingMusic];
    //获取下一首音乐
    currentIndex++;
    //判断是否越界
    if(currentIndex > _musics.count - 1){
        currentIndex = 0;
    }
    //取出下一首音乐
    ZYMusics *nextMusic = _musics[currentIndex];
    
    _playingMusic = nextMusic;
    
    return nextMusic;
}

/// 播放上一首音乐
+ (ZYMusics *)previousMusic{
    
    // 1.获取当前正在播放的音乐
    NSInteger currentIndex = [_musics indexOfObject:_playingMusic];
    
    // 2.获取上一首音乐
    // 2.1.索引减1
    currentIndex--;
    // 2.2.判断是否越界
    if (currentIndex < 0) {
        currentIndex = _musics.count - 1;
    }
    // 2.3.取出下一首音乐
    ZYMusics *previousMusic = _musics[currentIndex];
    
    _playingMusic = previousMusic;
    
    return previousMusic;
    
}


@end
