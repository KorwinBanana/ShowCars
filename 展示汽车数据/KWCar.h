//
//  KWCar.h
//  展示汽车数据
//
//  Created by korwin on 2017/8/9.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWCar : NSObject

@property (nonatomic,strong) NSString  *name;

@property (nonatomic,strong) NSString  *icon;

+ (instancetype) carWithName: (NSString *) name icon:(NSString *) icon;

+ (instancetype) carWithDict: (NSDictionary *) dict;

@end
