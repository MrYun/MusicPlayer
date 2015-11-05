//
//  ZYMusics.h
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/5.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYMusics : NSObject
/// 歌曲名称
@property (nonatomic, copy) NSString *name;
/// 歌曲文件名
@property (nonatomic, copy) NSString *filename;
/// 歌词
@property (nonatomic, copy) NSString *lrcname;
/// 歌手名字
@property (nonatomic, copy) NSString *singer;
/// 歌手头像
@property (nonatomic, copy) NSString *singerIcon;
/// 歌手大图
@property (nonatomic, copy) NSString *icon;

@end
