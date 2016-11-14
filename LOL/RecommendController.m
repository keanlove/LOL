//
//  RecommendController.m
//  LOL
//
//  Created by Kean on 16/7/2.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "RecommendController.h"
#import "RecentUpdateController.h"
#import "GatherController.h"
#import "HotAnchorController.h"
#import "CompetitionController.h"
#import "HSSegmentView.h"
#import "Public.h"

@interface RecommendController ()

@end

@implementation RecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐";
   
    RecentUpdateController *rvc = [[RecentUpdateController alloc] init];
    CompetitionController *cvc = [[CompetitionController alloc] init];
    GatherController *gvc = [[GatherController alloc] init];
    HotAnchorController *hvc = [[HotAnchorController alloc] init];

    
    NSArray *controllers = @[rvc, cvc, gvc, hvc];
    NSArray *titleArray = @[@"最近更新", @"最新比赛",@"精彩集锦", @"主播解说"];
    
    HSSegmentView *hss = [[HSSegmentView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height - 64) buttonName:titleArray contrllers:controllers parentController:self];
    
    [self.view addSubview:hss];
    
    
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
