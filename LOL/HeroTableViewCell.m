//
//  HeroTableViewCell.m
//  LOL
//
//  Created by Kean on 16/7/4.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HeroTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"

@interface HeroTableViewCell ()

@property (nonatomic, strong) UIImageView *picImage;
@property (nonatomic, strong) UILabel *titleName;
@property (nonatomic, strong) UILabel *pubTime;
@property (nonatomic, strong) UILabel *videoCount;

@end

@implementation HeroTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCellUI];
    }
    
    return self;

}

// 设计 cellUI
- (void)createCellUI {
    
    self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 98*KWidth_ScaleW, 98*KWidth_ScaleW)];
    self.picImage.layer.cornerRadius = 7;
    self.picImage.layer.masksToBounds = YES;
    [self.contentView addSubview:self.picImage];
    
    self.titleName = [[UILabel alloc] initWithFrame:CGRectMake(116*KWidth_ScaleW, 9*KWidth_ScaleW, screen_width - 120*KWidth_ScaleW, 24*KWidth_ScaleW)];
    self.titleName.font = [UIFont systemFontOfSize:23*KWidth_ScaleW];
    [self.contentView addSubview:self.titleName];
 
    self.pubTime = [[UILabel alloc] initWithFrame:CGRectMake(116*KWidth_ScaleW, 86*KWidth_ScaleW, screen_width - 234*KWidth_ScaleW, 18*KWidth_ScaleW)];
    self.pubTime.textColor = [UIColor grayColor];
    self.pubTime.font = [UIFont systemFontOfSize:17*KWidth_ScaleW];
    [self.contentView addSubview:self.pubTime];
    
    self.videoCount = [[UILabel alloc] initWithFrame:CGRectMake(screen_width - 98*KWidth_ScaleW, 86*KWidth_ScaleW, 88*KWidth_ScaleW, 22*KWidth_ScaleW)];
    self.videoCount.font = [UIFont systemFontOfSize:17*KWidth_ScaleW];
    self.videoCount.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.videoCount];

}

// 设置 cell 的数据

- (void)setHeroData:(HeroModel *)heroData {

    [self.picImage sd_setImageWithURL:[NSURL URLWithString:heroData.Pic]placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    self.titleName.text = [NSString stringWithFormat:@"%@   %@",heroData.NickName,heroData.CName];
    self.videoCount.text = [NSString stringWithFormat:@"视频: %@",heroData.VideoCount];

    NSString *date = [heroData.PubTime stringByReplacingOccurrencesOfString:@"T" withString:@"  "];
    self.pubTime.text = date;

}

// 创建 cell
+ (instancetype)loadCellWithTableView:(UITableView *)tableView {

    static NSString *identifier = @"identifier";
    
    HeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        
        cell = [[HeroTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    }
    
    return cell;

}

@end















