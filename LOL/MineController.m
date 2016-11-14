//
//  MineController.m
//  LOL
//
//  Created by Kean on 16/7/2.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "MineController.h"
#import "HistoryController.h"
#import "AboutViewController.h"
#import "Public.h"

@interface MineController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MineController {

    UITableView *_tableView;
    NSArray *_dataArray;


}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    // 刷新缓存
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    // 创建数据源
    _dataArray = @[@"观看历史", @"清理缓存", @"前往评分", @"关于我们", @"版本信息"];
    [self initTableView];
}

  // 创建TableView
- (void)initTableView {
 
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 5, 0, 5);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];

}

#pragma mark -- UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return 2;
    } else {
        return 1;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50 * KWidth_ScaleW;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30 * KWidth_ScaleW;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if (indexPath.section == 0) {
        
        static NSString *identifier = @"Identifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        
        cell.textLabel.text = _dataArray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.section == 1) {
        
        static NSString *identifier = @"Identifier1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];

        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = _dataArray[indexPath.row + 1];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f M",[self filePath]];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:19];
        return cell;
    }
    
    if (indexPath.section == 2) {
        
        static NSString *identifier = @"Identifier2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        
        cell.textLabel.text = _dataArray[indexPath.row + 2];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    if (indexPath.section == 3) {
        
        static NSString *identifier = @"Identifier3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            
        }
        
        cell.textLabel.text = _dataArray[indexPath.row + 4];
        cell.detailTextLabel.text = @"1.0";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:21*KWidth_ScaleW];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        HistoryController *hvc = [[HistoryController alloc] init];
        
        [self.navigationController pushViewController:hvc animated:YES];
        
    }
    
    else if (indexPath.section == 1) {
        
            if ([self filePath] != 0) {
            
            [self clearFile];
        
        }
        
    }
    
    else if (indexPath.section == 2 && indexPath.row == 1) {
    
        AboutViewController *about = [[AboutViewController alloc] init];
        [self.navigationController pushViewController:about animated:YES];
    
    }
    else if (indexPath.section == 2 && indexPath.row == 0) {
        NSString *str = @"https://itunes.apple.com/cn/app/ying-xiong-shi-pin/id1135275710?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}



// --------------------- 清理缓存 ------------------ //
// 显示缓存大小

- (float)filePath {

    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    return [self folderSizeAtPath :cachPath];

}


// 1. 首先计算单个文件的大小

- (long long)fileSizeAtPath:(NSString *)filePath {

    NSFileManager *manager = [NSFileManager defaultManager];

    if ([manager fileExistsAtPath:filePath]) {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;

}


// 2.遍历文件获得文件大小,返回的单位是M

- (float)folderSizeAtPath:(NSString *)folderPath {
    
    NSFileManager *manager = [NSFileManager defaultManager];

    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString *fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    
    return folderSize / (1024.0 * 1024.0);
}


// 清理缓存

- (void)clearFile {
    
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];

    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
   
   // NSLog(@"cachPath = %@",cachPath);
    
    [files enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSError *error = nil;
        
        NSString *path = [cachPath stringByAppendingPathComponent:obj];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
        
    }];

    [self performSelectorOnMainThread:@selector(clearCachSuccess) withObject:nil waitUntilDone:YES];

}

// 清理成功

- (void)clearCachSuccess {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"清理成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
