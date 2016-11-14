//
//  LiveCollectionViewCell.h
//  LOL
//
//  Created by Kean on 16/7/11.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveModel.h"

@interface LiveCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) LiveModel *liveModel;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIView *view;
//@property (nonatomic, strong) UIImageView *peopleImage;
@property (nonatomic, strong) UILabel *name;
//@property (nonatomic, strong) UILabel *people;
@property (nonatomic, strong) UILabel *title;


@end
