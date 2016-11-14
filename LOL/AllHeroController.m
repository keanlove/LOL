//
//  AllHeroController.m
//  LOL
//
//  Created by Kean on 16/7/3.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "AllHeroController.h"
#import "HeroTableViewCell.h"
#import "HeroModel.h"
#import "HeroVideoController.h"
#import "HeroSingleton.h"
#import "FreeHeroModel.h"
#import "NetworkSingleton.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "Public.h"
#import "URL.h"

BOOL _bool = YES;

@interface AllHeroController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AllHeroController {

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSIndexPath *_index;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_bool == YES) {
    
        [_tableView.header beginRefreshing];
       
        _bool = NO;
    
    }
}


- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    [_tableView deselectRowAtIndexPath:_index animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    [self loadMoreData];

}

// （上下拉刷新）加载更多的数据
- (void)loadMoreData {

    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [[NetworkSingleton sharedManager] GET:ALLHERO_URL parameters:nil success:^(id responseObject) {
            
            _dataArray = [HeroModel objectArrayWithKeyValuesArray:[responseObject objectForKey:@"Data"]];
            
            [_tableView reloadData];
            [_tableView.header endRefreshing];
            
        } failure:^(NSError *error) {
            
            [_tableView.header endRefreshing];

            
        }];
        

        
    }];
    
    
}


- (void)initTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.rowHeight = 110*KWidth_ScaleW;
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
    
    HeroTableViewCell *cell = [HeroTableViewCell loadCellWithTableView:tableView];

    cell.heroData = _dataArray[indexPath.row];
    
    return cell;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 150*KWidth_ScaleW;

}

// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    _index = [tableView indexPathForSelectedRow];

    HeroVideoController *TV = [[HeroVideoController alloc] init];
    
    HeroModel *model = _dataArray[indexPath.row];
    [HeroSingleton shareData].heroId = model.Id;
    [HeroSingleton shareData].cName = model.CName;
  
    [self.navigationController pushViewController:TV animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
