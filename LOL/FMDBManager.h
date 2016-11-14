//
//  FMDBManager.h
//  LOL
//
//  Created by Kean on 16/7/13.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HistoryModel.h"
#import "FMDatabase.h"

@interface FMDBManager : NSObject {

    FMDatabase *_dataBase;

}

+ (instancetype)shareInstance;
- (instancetype)init;

- (void)insertIntoWithName:(NSString *)image titleS:(NSString *)title dateS:(NSString *)date countS:(NSString *)count videoURL:(NSString *)url;

- (void)deleteWithModel:(HistoryModel *)model;

- (NSMutableArray *)select;

- (void)clear;

@end
