//
//  HeroSingleton.h
//  LOL
//
//  Created by Kean on 16/7/6.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroSingleton : NSObject

@property (nonatomic, strong) NSString *heroId;
@property (nonatomic, strong) NSString *cName;
@property (nonatomic, strong) NSMutableArray *array;

+(HeroSingleton *)shareData;

@end
