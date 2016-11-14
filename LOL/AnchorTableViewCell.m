//
//  AnchorTableViewCell.m
//  LOL
//
//  Created by Kean on 16/7/10.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "AnchorTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"


@implementation AnchorTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCellUI];
    }
    
    return self;
}

- (void)createCellUI {
    
    self.shotImage = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 98*KWidth_ScaleW, 98*KWidth_ScaleW)];
    self.shotImage.layer.cornerRadius = 7;
    self.shotImage.layer.masksToBounds = YES;
    [self.contentView addSubview:self.shotImage];
    
    self.titleName = [[UILabel alloc] initWithFrame:CGRectMake(116*KWidth_ScaleW, 0, screen_width - 120*KWidth_ScaleW, 67*KWidth_ScaleW)];
    self.titleName.font = [UIFont systemFontOfSize:24*KWidth_ScaleW];
    self.titleName.numberOfLines = 0;
    [self.contentView addSubview:self.titleName];
    
    self.upDate = [[UILabel alloc] initWithFrame:CGRectMake(116*KWidth_ScaleW, 86*KWidth_ScaleW, screen_width - 240*KWidth_ScaleW, 18*KWidth_ScaleW)];
    self.upDate.textColor = [UIColor grayColor];
    self.upDate.font = [UIFont systemFontOfSize:17*KWidth_ScaleW];
    [self.contentView addSubview:self.upDate];
    
    self.videoLength = [[UILabel alloc] initWithFrame:CGRectMake(screen_width - 104*KWidth_ScaleW, 86*KWidth_ScaleW, 104*KWidth_ScaleW, 18*KWidth_ScaleW)];
    self.videoLength.font = [UIFont systemFontOfSize:17*KWidth_ScaleW];
    
    [self.contentView addSubview:self.videoLength];
    
    
    
}

- (void)setAnchorModel:(AnchorModel *)anchorModel {
    
    [self.shotImage sd_setImageWithURL:[NSURL URLWithString:anchorModel.P] placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    
    self.titleName.text = [NSString stringWithFormat:@"%@",anchorModel.N];
        
    NSString *date = [anchorModel.T stringByReplacingOccurrencesOfString:@"T" withString:@"  "];
    self.upDate.text = date;
    
    self.videoLength.text = [NSString stringWithFormat:@"视频：%@", anchorModel.V];
    
    
}

+ (instancetype)loadCellWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"cell";
    
    AnchorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[AnchorTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
    
}

@end
