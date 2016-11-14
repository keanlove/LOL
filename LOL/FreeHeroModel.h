//
//  FreeHeroModel.h
//  LOL
//
//  Created by Kean on 16/7/8.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FreeHeroModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *Id;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
