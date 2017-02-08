//
//  Person.m
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description
{
    NSArray *keys = @[@"name",@"age"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}
@end
