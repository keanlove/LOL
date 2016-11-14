//
//  AnchorVideoViewCell.h
//  LOL
//
//  Created by Kean on 16/7/10.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface AnchorVideoViewCell : UITableViewCell

@property (nonatomic, strong) VideoModel *videoModel;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;


@end
