//
//  LiveCollectionViewCell.m
//  LOL
//
//  Created by Kean on 16/7/11.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "LiveCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Public.h"

@implementation LiveCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self createCell];
    
    }
    
    return self;

}

- (void)createCell {
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 80*KWidth_ScaleW)];
    self.image.layer.cornerRadius = 7;
    self.image.layer.masksToBounds = YES;
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.image.frame) - 15*KWidth_ScaleW, CGRectGetWidth(self.frame), 15*KWidth_ScaleW)];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.alpha = 0.1;
    [self.image addSubview:self.view];
    [self.contentView addSubview:self.image];

    self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.view.frame), 180*KWidth_ScaleW, 15*KWidth_ScaleW)]; // 110 180
    self.name.textColor = [UIColor whiteColor];
    self.name.font = [UIFont systemFontOfSize:14*KWidth_ScaleW];
    self.name.alpha = 0.9;
    [self.contentView addSubview:self.name];
    
//    self.people = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - 52, CGRectGetMinY(self.view.frame),52, 15)];
//    self.people.textColor = [UIColor whiteColor];
//    self.people.font = [UIFont systemFontOfSize:12];
//    self.people.alpha = 0.9 ;
//    
//    [self.contentView addSubview:self.people];
//    
//    self.peopleImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) - 70, CGRectGetMinY(self.view.frame),15, 15)];
//    [self.contentView addSubview:self.peopleImage];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.image.frame) + 7*KWidth_ScaleW, CGRectGetWidth(self.frame), 40*KWidth_ScaleW)];
    self.title.font = [UIFont systemFontOfSize:16*KWidth_ScaleW];
    self.title.numberOfLines = 0;
    [self.contentView addSubview:self.title];

}

- (void)setLiveModel:(LiveModel *)liveModel {
 
    
/**
*  战旗
*/
    [self.image sd_setImageWithURL:[NSURL URLWithString:liveModel.pic] placeholderImage:[UIImage imageNamed:@"icon@2x"]];
    
    self.name.text = [NSString stringWithFormat:@"%@", liveModel.title];
    
    self.title.text = [NSString stringWithFormat:@"%@", liveModel.subtitle];
   
//    [self.image sd_setImageWithURL:[NSURL URLWithString:liveModel.P] placeholderImage:[UIImage imageNamed:@"icon@2x"]];
//    
//    self.name.text = [NSString stringWithFormat:@" %@", liveModel.N];
//    
//    self.peopleImage.image = [UIImage imageNamed:@"Image_online_gray@2x"];
//    
//    self.people.text = [NSString stringWithFormat:@" %0.1f万", [liveModel.F floatValue] / 10000];
//    
//    self.title.text = [NSString stringWithFormat:@"【%@】%@", liveModel.W, liveModel.T];


}

@end











