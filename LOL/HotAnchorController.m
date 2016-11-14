//
//  HotAnchorController.m
//  LOL
//
//  Created by Kean on 16/7/9.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HotAnchorController.h"
#import "AllHeroController.h"
#import "ZXVideo.h"
#import "VideoPlayViewController.h"
#import "AnchorVideoController.h"
#import "AnchorTableViewCell.h"
#import "AnchorModel.h"
#import "NetworkSingleton.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "Public.h"
#import "URL.h"

@interface HotAnchorController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HotAnchorController {

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSIndexPath *_index;

}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    [_tableView deselectRowAtIndexPath:_index animated:NO];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self initTableView];
    [self loadMoreData];
    
}

- (void)loadMoreData {
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
 
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@",Anchor_URL] parameters:nil success:^(id responseObject) {
                
                NSDictionary *rootDic2 = [responseObject objectForKey:@"Data"];
                NSArray *array = [rootDic2 objectForKey:@"Result"];

                _dataArray = [AnchorModel objectArrayWithKeyValuesArray:array];

                [_tableView reloadData];
                [_tableView.header endRefreshing];
                
            } failure:^(NSError *error) {
                
                [_tableView.header endRefreshing];
                
            }];

        });
    }];
    
    [_tableView.header beginRefreshing];
    
    
}


- (void)initTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.rowHeight = 110*KWidth_ScaleW;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 5, 0, 5);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnchorTableViewCell *cell = [AnchorTableViewCell loadCellWithTableView:tableView];
    
    cell.anchorModel = _dataArray[indexPath.item];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
    
}

// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    _index = [tableView indexPathForSelectedRow];

    AnchorVideoController *avc = [[AnchorVideoController alloc] init];
    avc.model = _dataArray[indexPath.row];

    [self.navigationController pushViewController:avc animated:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
