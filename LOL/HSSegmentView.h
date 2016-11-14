//
//  HSSegmentView.h
//  LOL
//
//  Created by Kean on 16/7/3.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSSegmentView : UIView <UIScrollViewDelegate>


- (instancetype)initWithFrame:(CGRect)frame buttonName:(NSArray*)buttonName contrllers:(NSArray*)contrllers parentController:(UIViewController*)parentC;


@end
