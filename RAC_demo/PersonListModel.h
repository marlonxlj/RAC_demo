//
//  PersonListModel.h
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//列表数据模型，负责加载数据(网络数据，本地数据)
@interface PersonListModel : NSObject

@property (nonatomic, strong) NSMutableArray<Person *> *personList;
//加载联系人数据
- (void)loadPersons;
@end
