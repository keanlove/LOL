//
//  VideoTableViewCell.h
//  LOL
//
//  Created by Kean on 16/7/5.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#import "HistoryModel.h"

@interface VideoTableViewCell : UITableViewCell

@property (nonatomic, strong) VideoModel *videoModel;
@property (nonatomic, strong) HistoryModel *historyModel;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;
@end
