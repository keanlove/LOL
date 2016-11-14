//
//  HSSegmentView.m
//  LOL
//
//  Created by Kean on 16/7/3.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HSSegmentView.h"
#import "Public.h"
@interface HSSegmentView ()

@property (nonatomic, strong) NSArray *buttonName;
@property (nonatomic, strong) UILabel *underLine;
@property (nonatomic, strong) UILabel *downLine;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, strong) UIScrollView *segmentScrollV;

@end

@implementation HSSegmentView

- (instancetype)initWithFrame:(CGRect)frame buttonName:(NSArray *)buttonName contrllers:(NSArray *)contrllers parentController:(UIViewController *)parentC {
    
    if (self = [super initWithFrame:frame]) {
        
        self.buttonName = buttonName;
        self.controllers = contrllers;
        
        // 创建segementView
        
        self.segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 48*KWidth_ScaleW)];
        self.segmentView.tag = 50;
        [self addSubview:self.segmentView];
        
        
        //  创建segmentScrollV
        
        self.segmentScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 48*KWidth_ScaleW, screen_width, frame.size.height - 48*KWidth_ScaleW)];
        self.segmentScrollV.contentSize = CGSizeMake(screen_width * self.controllers.count, 0);
        self.segmentScrollV.showsHorizontalScrollIndicator = NO;
        self.segmentScrollV.pagingEnabled = YES;
        self.segmentScrollV.bounces = YES;
        self.segmentScrollV.delegate = self;
        [self addSubview:self.segmentScrollV];
        
        // 创建ViewController并添加到segmentScrollV
        
        for (int i = 0; i < self.controllers.count; i++) {
            
            UIViewController *contro = self.controllers[i];
            contro.view.frame = CGRectMake(i * screen_width, 0, screen_width, frame.size.height);
            [self.segmentScrollV addSubview:contro.view];
            [parentC addChildViewController:contro];
            [contro didMoveToParentViewController:parentC];
            
        }
        
        
        // 创建segmentButton 和 line
        
        for (int i = 0; i < self.controllers.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * (screen_width / self.controllers.count), 0, screen_width / self.controllers.count, 48*KWidth_ScaleW);
            button.tag = i;
            [button setTitle:self.buttonName[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:20*KWidth_ScaleW];
            if (i == 0) {
                
                button.selected = YES;
                self.selectButton = button;
                button.titleLabel.font = [UIFont systemFontOfSize:23*KWidth_ScaleW];
               
            }
            else {
            
                button.selected = NO;
                
            }
            
            [self.segmentView addSubview:button];
        }
        
        // 添加下划线
        self.underLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 46*KWidth_ScaleW, screen_width / self.controllers.count, 2)];
        
        self.underLine.backgroundColor = [UIColor redColor];
        self.underLine.tag = 70;
        [self.segmentView addSubview:self.underLine];
        
        self.downLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 48.5*KWidth_ScaleW, screen_width, 0.5*KWidth_ScaleW)];
        self.downLine.backgroundColor = [UIColor grayColor];
        [self.segmentView addSubview:self.downLine];
        
    }

    return self;
}

- (void)Click:(UIButton *)sender {
  
    self.selectButton.titleLabel.font = [UIFont systemFontOfSize:20*KWidth_ScaleW];
    self.selectButton.selected = NO;
    self.selectButton = sender;
    self.selectButton.selected = YES;
    self.selectButton.titleLabel.font = [UIFont systemFontOfSize:23*KWidth_ScaleW];
    [UIView animateWithDuration:0.2 animations:^{
       
        CGPoint frame = self.underLine.center;
        frame.x = screen_width / (self.controllers.count * 2) + (screen_width / self.controllers.count) * (sender.tag);
        self.underLine.center = frame;
        
    }];
    
    [self.segmentScrollV setContentOffset:CGPointMake((sender.tag) * screen_width, 0) animated:YES];



}

#pragma mark  UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [UIView animateWithDuration:0.2 animations:^{
        
        CGPoint frame = self.underLine.center;
        frame.x = screen_width / (self.controllers.count * 2) + (screen_width / self.controllers.count) * (self.segmentScrollV.contentOffset.x/screen_width);
        self.underLine.center = frame;
     
    }];
    
    UIButton *button = (UIButton *)[self.segmentView viewWithTag:self.segmentScrollV.contentOffset.x / screen_width];
    self.selectButton.titleLabel.font = [UIFont systemFontOfSize:20*KWidth_ScaleW];
    self.selectButton.selected = NO;
    self.selectButton = button;
    self.selectButton.selected = YES;
    self.selectButton.titleLabel.font = [UIFont systemFontOfSize:23*KWidth_ScaleW];

}

@end
