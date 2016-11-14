//
//  FreeTableViewCell.h
//  LOL
//
//  Created by Kean on 16/7/9.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeHeroModel.h"

@interface FreeTableViewCell : UITableViewCell

@property (nonatomic, strong) FreeHeroModel *heroData;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;


@end
