//
//  LiveTelecastController.m
//  LOL
//
//  Created by Kean on 16/7/11.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "LiveTelecastController.h"
#import "LiveCollectionViewCell.h"
#import "VideoPlayViewController.h"
#import "NetworkSingleton.h"
#import "MJExtension.h"
#import "LiveModel.h"
#import "MJRefresh.h"
#import "ZXVideo.h"
#import "Public.h"
#import "URL.h"


static NSString *identifier = @"LiveCollectionViewCell";

@interface LiveTelecastController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {

    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;


}



@end

@implementation LiveTelecastController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"直播";
    [self initCollectionView];
    [self loadData];
}

/**
 *   加载数据
 */
- (void)loadData {
    
    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@",ZhanQiURL] parameters:nil success:^(id responseObject) {
            
//            NSDictionary *rootDic2 = [responseObject objectForKey:@"Data"];
//            NSArray *array = [rootDic2 objectForKey:@"Result"];

/**
 *  战旗
 */
            _dataArray = [LiveModel objectArrayWithKeyValuesArray:responseObject];

//            _dataArray = [LiveModel objectArrayWithKeyValuesArray:array];

            [_collectionView reloadData];
            [_collectionView.header endRefreshing];
            
        } failure:^(NSError *error) {
            
            [_collectionView.header endRefreshing];
            
        }];

        
    });
        
    }];

    [_collectionView.header beginRefreshing];

}

/**
 *  创建 CollectionView
 */
- (void)initCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = RGBA(200, 200, 200, 0.25);
    _collectionView.showsVerticalScrollIndicator = NO;
 
    // [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    // 注册
    
    [_collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    [self.view addSubview:_collectionView];

}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _dataArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.liveModel = _dataArray[indexPath.row];
    
    return cell;

}


#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZXVideo *video = [[ZXVideo alloc] init];
    VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
    
    LiveModel *model = _dataArray[indexPath.row];
   
    /**
     *  战旗URL
     */
    
    video.playUrl = model.playurl;
    video.title = model.subtitle;
    vc.video = video;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    /**
     *  全面URL
     */
    // 请求PlayURL
//    [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@%@", LiveVideoURL_1,model.I] parameters:nil success:^(id responseObject) {
//        
//        NSDictionary *dic = [responseObject objectForKey:@"Data"];
//
//        video.playUrl = dic[@"Result"];
//        vc.video = video;
//        vc.hidesBottomBarWhenPushed = YES;
//
//        [self.navigationController pushViewController:vc animated:YES];
//        
//    } failure:^(NSError *error) {
//                
//    }];

    
}


#pragma mark UICollectionViewDelegateFlowLayout


// 设置cell 坐标
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}



// 设置cell大小可以改变一行有多少个cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((screen_width / 2.21), (screen_width / 2.21));
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return - 15;


}



//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//
//    return CGSizeMake(0, - 40);
//
//}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
