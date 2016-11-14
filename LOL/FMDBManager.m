//
//  FMDBManager.m
//  LOL
//
//  Created by Kean on 16/7/13.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "FMDBManager.h"

@implementation FMDBManager

+ (instancetype)shareInstance {

    static FMDBManager *shareInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[FMDBManager alloc] init];
    });
    
    return shareInstance;

}

- (instancetype)init {

    if (self = [super init]) {
        
        [self createDataBase];
        
    }

    return self;
}

/**
 *  创建数据库
 */

- (void)createDataBase {
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"test.sqlite"];
    _dataBase = [[FMDatabase alloc] initWithPath:path];
    
    if ([_dataBase open]) {
        
      //  NSLog(@"数据库打开了");
        
    }
  
    NSString *createTableSql = @"create table if not exists history (id integer primary key autoincrement,image varchar (256),title varchar (256),date varchar (256),count varchar (256),url varchar (256))";
    
    
    if ([_dataBase executeUpdate:createTableSql]) {
        
      //  NSLog(@"历史表创建成功");
    }


}

/**
 *  数据插入
 */
- (void)insertIntoWithName:(NSString *)image titleS:(NSString *)title dateS:(NSString *)date countS:(NSString *)count videoURL:(NSString *)url {

    NSString *selectSql = @"select *from history";
    FMResultSet *set = [_dataBase executeQuery:selectSql];
    HistoryModel *model = [[HistoryModel alloc] init];
    
    while ([set next]) {
            
        model.title = [set stringForColumn:@"title"];
        
    }

    if (![model.title isEqualToString:title]) {
        
        NSString *insertSql = @"insert into history(image,title,date,count,url)values(?,?,?,?,?)";
        
        if ([_dataBase executeUpdate:insertSql,image,title,date,count,url]) {
            
     //       NSLog(@"数据插入成功");
            
        }
    }
}

/**
 *  数据查找 查找将要放在历史记录的数据并把他们放到数组里作为历史记录的数据
 */

- (NSMutableArray *)select {

    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *selectSql = @"select *from history";
    FMResultSet *set = [_dataBase executeQuery:selectSql];
   
    //image,title,date,count
    while ([set next]) {
        
        HistoryModel *model = [[HistoryModel alloc] init];
        model.image = [set stringForColumn:@"image"];
        model.title = [set stringForColumn:@"title"];
        model.date = [set stringForColumn:@"date"];
        model.count = [set stringForColumn:@"count"];
        model.url = [set stringForColumn:@"url"];
        
        [array addObject:model];
        
    }
    return array;

}

/**
 *  删除方法
 */

- (void)deleteWithModel:(HistoryModel *)model {
    
    NSString *deleteSql = @"delete from history where title = ?";
    
    if ([_dataBase executeUpdate:deleteSql,model.title]) {
    
     //   NSLog(@"删除成功");
    
    }

}

- (void)clear {
    
    [_dataBase executeUpdate:@"DELETE FROM history"];
  //  NSLog(@"清空完成");
}


@end

































