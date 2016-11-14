//
//  LiveModel.h
//  LOL
//
//  Created by Kean on 16/7/11.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveModel : NSObject

//@property (nonatomic, copy) NSString *P;
//@property (nonatomic, copy) NSString *W;
//@property (nonatomic, copy) NSString *N;
//@property (nonatomic, copy) NSString *F;
//@property (nonatomic, copy) NSString *T;
//@property (nonatomic, copy) NSString *I;

/**
 *  战旗
 */
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *playurl;



- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
