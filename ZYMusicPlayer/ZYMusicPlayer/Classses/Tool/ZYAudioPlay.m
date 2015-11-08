//
//  ZYAudioPlay.m
//  录制和音乐播放
//
//  Created by 赵云 on 15/10/31.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYAudioPlay.h"

@implementation ZYAudioPlay
/// 定义一个存储soundName的字典
static NSMutableDictionary *_SoundIds;
/// 存储musicName的字典
static NSMutableDictionary *_musics;

//第一次用本类的时候调用
+ (void)initialize{
    
    _SoundIds = [NSMutableDictionary dictionary];
    
    _musics = [NSMutableDictionary dictionary];
}


#pragma mark - 播放音乐
/// 开始播放音乐
+ (AVAudioPlayer *)startPlayMusic:(NSString *)musicName{
    
    //断言
    NSAssert(musicName, @"不能为空值");
    
    //取出播放器
    AVAudioPlayer *player = _musics[musicName];
    
    //判断播放器是否为空
    if (player == nil) {
        //获取资源路径
        NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        //创建播放器对象
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        //准备播放
        [player prepareToPlay];
        //存入字典中
        _musics[musicName] = player;
    }
    //播放音乐
    [player play];
    //返回播放器
    return player;
    
}

/// 暂停播放音乐
+ (void)pausePlayMusic:(NSString *)musicName{
    
    NSAssert(musicName, @"不能为空zhi");
    //取出播放器
    AVAudioPlayer *player = _musics[musicName];
    if (player) {
        [player pause];
    }
    
    
}

/// 停止播放音乐
+ (void)stopPlayMusic: (NSString *)musicName{
    
    //取出播放器
    AVAudioPlayer *player = _musics[musicName];
    if (player) {
        [player stop];
        player = nil;
        [_musics removeObjectForKey:musicName];
        
    }
    
}


#pragma mark - 播放音效
+ (void)playSound: (NSString *)soundName{
    //从字典中取出soundId
    SystemSoundID soundId = [_SoundIds[soundName] unsignedIntValue];
    //如果从字典中取出的是0 需要给soundId赋值
    if(soundId == 0){
        //获取资源的URL
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        
        //给soundId赋值
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &soundId);
        
        //放入字典中
        _SoundIds[soundName] = @(soundId);
        
    }
    
    //播放音效
    AudioServicesPlaySystemSound(soundId);
}

///销毁音效
+ (void)disposSoundWithName:(NSString *)soundName{
    
    //从字典中取出音效的ID
    SystemSoundID soundId = [_SoundIds[soundName] unsignedIntValue];
    
    if (soundId) {
        //销毁
        AudioServicesDisposeSystemSoundID(soundId);
    }
    
}








@end
