//
//  FreeHeroController.m
//  LOL
//
//  Created by Kean on 16/7/3.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "FreeHeroController.h"
#import "NetworkSingleton.h"
#import "FreeTableViewCell.h"
#import "FreeHeroModel.h"
#import "MJRefresh.h"
#import "Public.h"
#import "URL.h"

@interface FreeHeroController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation FreeHeroController{
    
    UITableView *_tableView;
    NSMutableArray *_dataArray;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    [self initTableView];
    [self loadMoreData];
}



- (void)loadMoreData {


    [[NetworkSingleton sharedManager] GET:Free_URL parameters:nil success:^(id responseObject) {
        NSDictionary *dic = [responseObject objectForKey:@"data"];
        
        for (NSDictionary *dic2 in dic) {
            
            FreeHeroModel *model = [[FreeHeroModel alloc] init];
            
            model.name = dic[dic2][@"name"];
            model.title = dic[dic2][@"title"];
            model.Id = dic[dic2][@"id"];
            [_dataArray addObject:model];
        }

        [_tableView reloadData];
        
        
    } failure:^(NSError *error) {
        NSLog(@"1");
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
    
    FreeTableViewCell *cell = [FreeTableViewCell loadCellWithTableView:tableView];
    
    cell.heroData = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 150*KWidth_ScaleW;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
