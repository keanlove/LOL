//
//  AnchorVideoViewCell.m
//  LOL
//
//  Created by Kean on 16/7/10.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "AnchorVideoViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"


@interface AnchorVideoViewCell ()

@property (nonatomic, strong) UIImageView *videoImage;
@property (nonatomic, strong) UILabel *videoTitle;
@property (nonatomic, strong) UILabel *videoTime;
@property (nonatomic, strong) UILabel *videoCount;

@end

@implementation AnchorVideoViewCell

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
    [self.contentView addSubview:self.videoTitle];
    
    self.videoTime = [[UILabel alloc] initWithFrame:CGRectMake(146*KWidth_ScaleW, 86*KWidth_ScaleW, screen_width - 240*KWidth_ScaleW, 18*KWidth_ScaleW)];
    self.videoTime.textColor = [UIColor grayColor];
    self.videoTime.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
    [self.contentView addSubview:self.videoTime];
    
    self.videoCount = [[UILabel alloc] initWithFrame:CGRectMake(screen_width - 112*KWidth_ScaleW, 86*KWidth_ScaleW, 104*KWidth_ScaleW, 18*KWidth_ScaleW)];
    self.videoCount.font = [UIFont systemFontOfSize:15*KWidth_ScaleW];
    self.videoCount.textAlignment = NSTextAlignmentRight;

    [self.contentView addSubview:self.videoCount];
    
    
}

// 设置 cell 的数据

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

// 创建 cell
+ (instancetype)loadCellWithTableView:(UITableView *)tableView {
    
    static NSString *Identifier = @"cell";
    AnchorVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        
        cell = [[AnchorVideoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
    }
    
    return cell;
    
}




@end
