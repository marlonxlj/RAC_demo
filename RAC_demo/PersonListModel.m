//
//  PersonListModel.m
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "PersonListModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation PersonListModel

- (void)loadPersons
{
    NSLog(@"%s",__FUNCTION__);
    _personList = @[].mutableCopy;
    //异步加载数据
    dispatch_async(dispatch_get_main_queue(), ^{
       
        [NSThread sleepForTimeInterval:1.0];
        
        for (NSInteger i = 0; i <  20; i++) {
            Person *person = [Person new];
            
            person.name = @[[@"zhangsan-%d" stringByAppendingFormat:@"%ld",(long)i]];
            person.age = 15 + arc4random_uniform(20);
                            
            [_personList addObject:person];
        }
        NSLog(@"%@",_personList);
    });
}

@end
