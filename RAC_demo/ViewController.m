//
//  ViewController.m
//  RAC_demo
//
//  Created by m on 2017/2/8.
//  Copyright © 2017年 XLJ. All rights reserved.
//

#import "ViewController.h"
#import "PersonListModel.h"
#import "UIImage+Extension.h"

@interface ViewController ()
{
    PersonListModel *_personsViewModel;
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
}

@end
