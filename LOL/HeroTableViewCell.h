//
//  HeroTableViewCell.h
//  LOL
//
//  Created by Kean on 16/7/4.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroModel.h"

@interface HeroTableViewCell : UITableViewCell

@property (nonatomic, strong) HeroModel *heroData;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;

@end
