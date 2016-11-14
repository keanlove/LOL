//
//  VideoModel.h
//  LOL
//
//  Created by Kean on 16/7/5.
//  Copyright © 2016年 Kean. All rights reserved.

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *P;
@property (nonatomic, copy) NSString *T;
@property (nonatomic, copy) NSString *A;
@property (nonatomic, copy) NSString *I;
@property (nonatomic, copy) NSString *V;
@property (nonatomic, copy) NSString *Key;
@property (nonatomic, copy) NSArray *F;

// 创建对象对象方法
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
