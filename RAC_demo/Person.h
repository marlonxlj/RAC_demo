//
//  Person.h
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

+ (instancetype)sharedObject ;

- (void)eat;

@end
