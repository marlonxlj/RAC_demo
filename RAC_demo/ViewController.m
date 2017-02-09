//
//  ViewController.m
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//
//Runtime的使用情况:
// 1.消息机制:调用私有方法
// 1.1 方法调用的流程:[p eat]怎么调用这个方法
//对象方法:保存在类对象方法列表中
//类方法:保存在元类中方法列表中
/*
 * 1.1.1 通过isa去对应的类中查找对象方法
 * 1.1.2 注册一个方法编号，根据方法编号去查找对应的方法
 *
 */
// 2.

#import "ViewController.h"
#import "PersonListModel.h"
#import "UIImage+Extension.h"

#import "Person.h"
#import <objc/message.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    PersonListModel *_personsViewModel;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData
{
    //1.实例化视图模型
    _personsViewModel = [PersonListModel new];
    
    //2.加载数据
    [_personsViewModel loadPersons];
    
#if 0
    [self creatTableView];
    
#elif 0
    
#endif
}


- (void)testRuntime
{
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    
    objc_msgSend(p, @selector(eat));
    
    objc_msgSend(p, @selector(run:),300);
}
- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"获取到cell返回的行数----111");
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"22";
    
    NSLog(@"创建好cell---222");
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"获取到cell返回的高度---333");
    return 50;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    UIImage *images = [UIImage imageNamed:@"houshijing"];
    [images xlj_cornerImageWithSize:imageView.bounds.size fillColor:[UIColor whiteColor] completion:^(UIImage *image) {
        imageView.image = image;
    }];
    
    [self testRuntime];

}

@end
