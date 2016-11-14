//
//  BaseTabBarController.m
//  LOL
//
//  Created by Kean on 16/7/2.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HeroController.h"
#import "RecommendController.h"
#import "MineController.h"
#import "BaseNaviController.h"
#import "LiveTelecastController.h"
#import "Public.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.opaque = YES;
    self.tabBar.tintColor = TabBar_T_Color;
    [self initChildViewControllers];
}

- (void)initChildViewControllers {
    
    NSMutableArray *childArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    RecommendController *recommendVC = [[RecommendController alloc] init];
    [recommendVC.tabBarItem setTitle:@"推荐"];
    [recommendVC.tabBarItem setImage:[UIImage imageNamed:@"btn_home_normal@3x"]];
    [recommendVC.tabBarItem setSelectedImage:[UIImage imageNamed: @"btn_home_selected@3x"]];
    BaseNaviController *naviRecommendVC = [[BaseNaviController alloc] initWithRootViewController:recommendVC];
    [childArray addObject:naviRecommendVC];
    
    
    HeroController *heroVC = [[HeroController alloc] init];
    [heroVC.tabBarItem setTitle:@"英雄"];
    [heroVC.tabBarItem setImage:[UIImage imageNamed:@"btn_hero_normal"]];
    [heroVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_hero_selected"]];
    BaseNaviController *naviHeroVC = [[BaseNaviController alloc] initWithRootViewController:heroVC];
    [childArray addObject:naviHeroVC];
    
    LiveTelecastController *liveVC = [[LiveTelecastController alloc] init];
    [liveVC.tabBarItem setTitle:@"直播"];
    [liveVC.tabBarItem setImage:[UIImage imageNamed:@"btn_live_normal@3x"]];
    [liveVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_live_selected@3x"]];
    BaseNaviController *naviLiveVC = [[BaseNaviController alloc] initWithRootViewController:liveVC];
    [childArray addObject:naviLiveVC];
    
    
    
    MineController *mineVC = [[MineController alloc] init];
    [mineVC.tabBarItem setTitle:@"我的"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"btn_user_normal@2x"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_user_selected@2x"]];
   
    BaseNaviController *naviMineVC = [[BaseNaviController alloc] initWithRootViewController:mineVC];
    [childArray addObject:naviMineVC];
    
    
    [self setViewControllers:childArray];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
