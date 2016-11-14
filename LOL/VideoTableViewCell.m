//
//  VideoTableViewCell.m
//  LOL
//
//  Created by Kean on 16/7/5.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"
#import "QuartzCore/QuartzCore.h"

@interface VideoTableViewCell ()

@property (nonatomic, strong) UIImageView *videoImage;
@property (nonatomic, strong) UILabel *videoTitle;
@property (nonatomic, strong) UILabel *videoTime;
@property (nonatomic, strong) UILabel *videoCount;

@end



@implementation VideoTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCell];
    }
    
    return self;
    
}

// 设计 cellUI
- (void)createCell {
    
    self.videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 128*KWidth_ScaleW, 98*KWidth_ScaleW)];
    self.videoImage.layer.cornerRadius = 7;
    self.videoImage.layer.masksToBounds = YES;
    [self.contentView addSubview:self.videoImage];
    
    self.videoTitle = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 0, screen_width - 30 - 120*KWidth_ScaleW, 67*KWidth_ScaleW)];
    self.videoTitle.font = [UIFont systemFontOfSize:21*KWidth_ScaleW];
    self.videoTitle.numberOfLines = 0;
    self.videoCount.textAlignment = NSTextAlignmentLeft;

    [self.contentView addSubview:self.videoTitle];
    
    self.videoTime = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 86*KWidth_ScaleW, screen_width - 240*KWidth_ScaleW, 22*KWidth_ScaleW)];
    self.videoTime.textColor = [UIColor grayColor];
    self.videoTime.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
    [self.contentView addSubview:self.videoTime];
    
    self.videoCount = [[UILabel alloc] initWithFrame:CGRectMake(screen_width - 108*KWidth_ScaleW, 86*KWidth_ScaleW, 99*KWidth_ScaleW, 23*KWidth_ScaleW)];
    self.videoCount.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
    self.videoCount.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.videoCount];

    
}

/**
 *  设置 VideoModel cell 的数据
 */

- (void)setVideoModel:(VideoModel *)videoData {
    
    [self.videoImage sd_setImageWithURL:[NSURL URLWithString:videoData.P]placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    self.videoTitle.text = [NSString stringWithFormat:@"%@",videoData.T];
    
    if (![videoData.V isEqualToString:@"0"]) {
        
        if ([videoData.V intValue] > 10000) {
            
            self.videoCount.text = [NSString stringWithFormat:@"%d万次播放",[videoData.V intValue] / 10000];
        }
        
        else {
            
            self.videoCount.text = [NSString stringWithFormat:@"%@次播放",videoData.V];
        }
        
        }
    else {
    
        self.videoCount.text = [NSString stringWithFormat:@"%u次播放",arc4random() % 501];
    
    }
    
    
    
    NSString *date = [videoData.A stringByReplacingOccurrencesOfString:@"T" withString:@"  "];
    self.videoTime.text = date;
    
}

/**
 *  设置 HistoryModel cell 的数据
 */

- (void)setHistoryModel:(HistoryModel *)historyModel {

    [self.videoImage sd_setImageWithURL:[NSURL URLWithString:historyModel.image] placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    self.videoTitle.text = [NSString stringWithFormat:@"%@",historyModel.title];
    
    if (![historyModel.count isEqualToString:@"0"]) {
        
        if ([historyModel.count intValue] > 10000) {
            
            self.videoCount.text = [NSString stringWithFormat:@"%d万次播放",[historyModel.count intValue] / 10000];
        }
        
        else {
            
            self.videoCount.text = [NSString stringWithFormat:@"%@次播放",historyModel.count];
        }
        
    }
    else {
        
        self.videoCount.text = [NSString stringWithFormat:@"%u次播放",arc4random() % 501];
        
    }
    
    
    
    NSString *date = [historyModel.date stringByReplacingOccurrencesOfString:@"T" withString:@"  "];
    self.videoTime.text = date;
    
}

// 创建 cell
+ (instancetype)loadCellWithTableView:(UITableView *)tableView {
    
    static NSString *Identifier = @"cell";
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        
        cell = [[VideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
    }
    
    return cell;
    
}


@end
