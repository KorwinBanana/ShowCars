//
//  CarGroup.h
//  展示汽车数据
//
//  Created by korwin on 2017/8/9.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject

//@property (nonatomic,strong) NSString  *header;
//
//@property (nonatomic,strong) NSString  *footer;

@property (nonatomic,strong) NSArray  *cars;

@property (nonatomic,strong) NSString  *title;

+ (instancetype) carGroupWithdict:(NSDictionary *)dict;

@end
