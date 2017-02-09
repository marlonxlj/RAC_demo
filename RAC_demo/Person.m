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
+ (instancetype)sharedObject {
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)eat
{
    NSLog(@"eat");
}

- (void)run:(NSInteger)metre
{
    NSLog(@"咆了多少%ld,累了休息一下",(long)metre);
}

@end
