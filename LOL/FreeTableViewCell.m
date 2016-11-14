//
//  FreeTableViewCell.m
//  LOL
//
//  Created by Kean on 16/7/9.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "FreeTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"
#import "URL.h"

@interface FreeTableViewCell ()

@property (nonatomic, strong) UIImageView *picImage;
@property (nonatomic, strong) UILabel *titleName;

@end

@implementation FreeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCellUI];
    }
    
    return self;
    
}

// 设计 cellUI
- (void)createCellUI {
    
    self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(6*KWidth_ScaleW, 6*KWidth_ScaleW, 98*KWidth_ScaleW, 98*KWidth_ScaleW)];
    [self.contentView addSubview:self.picImage];
    
    self.titleName = [[UILabel alloc] initWithFrame:CGRectMake(116*KWidth_ScaleW, 9*KWidth_ScaleW, screen_width - 120*KWidth_ScaleW, 24*KWidth_ScaleW)];
    self.titleName.font = [UIFont systemFontOfSize:23*KWidth_ScaleW];
    [self.contentView addSubview:self.titleName];
    
    
}

// 设置 cell 的数据

- (void)setHeroData:(FreeHeroModel *)heroData {
    
    
    [self.picImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.png",FreeIcon_URL,heroData.Id]] placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    self.titleName.text = [NSString stringWithFormat:@"%@   %@",heroData.name,heroData.title];
        
}

// 创建 cell
+ (instancetype)loadCellWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"identifier";
    FreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[FreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    return cell;
    
}


@end








