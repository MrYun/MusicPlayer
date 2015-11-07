//
//  ZYMusicsViewController.m
//  ZYMusicPlayer
//
//  Created by 赵云 on 15/11/5.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ZYMusicsViewController.h"
#import "MJExtension.h"
#import "ZYMusics.h"
#import "UIImage+Circle.h"
#import "ZYPlayingMusicViewController.h"

@interface ZYMusicsViewController ()

@property (nonatomic, strong) NSArray *musics;

//定义播放器属性
@property (nonatomic, strong) ZYPlayingMusicViewController *playingVC;

@end

@implementation ZYMusicsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //设置cell的行高
    self.tableView.rowHeight = 80;
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.musics.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"musicCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //给cell设置数据
    //首先取出模型的数据
    ZYMusics *musics = self.musics[indexPath.row];
    
    cell.imageView.image = [UIImage circleImageWithName:musics.singerIcon borderWidth:3.0 borderColor:[UIColor blackColor]];
    cell.textLabel.text = musics.name;
    cell.detailTextLabel.text = musics.singer;
    
    return cell;
}

//当点击cell的时候调用这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.让cell变为不选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.弹出控制器
    [self.playingVC show];
}

#pragma mark - 懒加载
- (NSArray *)musics{
    
    if(!_musics){
        
        self.musics = [ZYMusics objectArrayWithFilename:@"Musics.plist"];
        
    }
    return _musics;
    
}
-(ZYPlayingMusicViewController *)playingVC{
    if (!_playingVC) {
        _playingVC = [[ZYPlayingMusicViewController alloc] init];
    }
    return _playingVC;
}


@end
