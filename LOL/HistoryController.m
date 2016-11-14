//
//  HistoryController.m
//  LOL
//
//  Created by Kean on 16/7/13.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HistoryController.h"
#import "VideoPlayViewController.h"
#import "VideoTableViewCell.h"
#import "NetworkSingleton.h"
#import "HeroSingleton.h"
#import "FMDBManager.h"
#import "VideoModel.h"
#import "ZXVideo.h"
#import "Public.h"
#import "URL.h"

@interface HistoryController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation HistoryController {

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSIndexPath *_index;

}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    [_tableView deselectRowAtIndexPath:_index animated:NO];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self createData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"观看历史";
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setTitle:@"清空" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonI = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    self.navigationItem.rightBarButtonItem = buttonI;
    
    
    [self initWithTableView];
 
}
/**
 *   清空数据库
 */
- (void)clear {
    
    if (_dataArray.count) {
        
    [[FMDBManager shareInstance] clear];
    
    [_dataArray removeAllObjects];
    
    
    [_tableView reloadData];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"清空完成" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    }

}

- (void)createData {

    _dataArray = [[FMDBManager shareInstance] select];
    [_tableView reloadData];

}

- (void)initWithTableView {
  
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.rowHeight = 110*KWidth_ScaleW;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 5, 0, 5);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];



}

#pragma  mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    VideoTableViewCell *cell = [VideoTableViewCell loadCellWithTableView:tableView];
    
    cell.historyModel = _dataArray[indexPath.item];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _index = [tableView indexPathForSelectedRow];

    ZXVideo *video = [[ZXVideo alloc] init];
    VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
    HistoryModel *model = _dataArray[indexPath.row];
    
    video.playUrl = model.url;
    video.title = model.title;
    vc.video = video;
    vc.hidesBottomBarWhenPushed = YES;
   
    [self.navigationController pushViewController:vc animated:YES];
    
}

// 删除 cell 数据

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewCellEditingStyleDelete;

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     *  删除该条数据 在数据库的位置
     *
     *  删除该条数据 在数据源的位置
     *
     *  删除该条数据 所在的Cell
     */
    
    HistoryModel *model = _dataArray[indexPath.row];
    [[FMDBManager shareInstance] deleteWithModel:model];
    
    [_dataArray removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
