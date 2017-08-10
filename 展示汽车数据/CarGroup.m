//
//  CarGroup.m
//  展示汽车数据
//
//  Created by korwin on 2017/8/9.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "CarGroup.h"
#import "KWCar.h"

@implementation CarGroup

+ (instancetype) carGroupWithdict:(NSDictionary *)dict
{
    CarGroup *group = [[CarGroup alloc] init];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *carDict in dict[@"cars"]) {
        KWCar *car = [KWCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    group.title = dict[@"title"];
    return group;
}


@end
