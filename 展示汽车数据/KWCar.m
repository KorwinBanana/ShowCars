//
//  KWCar.m
//  展示汽车数据
//
//  Created by korwin on 2017/8/9.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "KWCar.h"

@implementation KWCar

+ (instancetype) carWithName: (NSString *) name icon:(NSString *) icon
{
    KWCar *car = [[KWCar alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}

+ (instancetype) carWithDict: (NSDictionary *) dict
{
    KWCar *car = [[KWCar alloc] init];
    car.icon = dict[@"icon"];
    car.name = dict[@"name"];
    return car;
}

@end
