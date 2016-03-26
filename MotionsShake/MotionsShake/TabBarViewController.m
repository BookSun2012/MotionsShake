//
//  TabBarViewController.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "TabBarViewController.h"
#import "TabBarModel.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewController:[self loadConfigerData]];
}

//加载配置文件
- (NSArray *)loadConfigerData {
    
    NSMutableArray *resultArr = [NSMutableArray array];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"TableBarList" ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:filePath];
    
    for (NSDictionary *dic in contentArray) {
        TabBarModel *model = [[TabBarModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    
//    //快速枚举遍历
//    [contentArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        TabBarModel *model = [[TabBarModel alloc]init];
//        //KVC
//        [model setValuesForKeysWithDictionary:obj];
//        
//        [resultArr addObject:model];
//        
//        
//    }];
    
    
    return resultArr ;
}
//创建分栏视图控制器
- (void)creatViewController:(NSArray *)tabarModelArr {
    NSMutableArray *resultarr = [NSMutableArray new];
//    [tabarModelArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        UIViewController *vc = [NSClassFromString(obj.)]
//    }];
    for (TabBarModel *model in tabarModelArr) {
        UIViewController *vc = [[NSClassFromString(model.classname) alloc]init ];
        vc.title = model.title;
        vc.tabBarItem.title = model.title;
        vc.tabBarItem.image = [UIImage imageNamed:model.image];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@HL",model.image]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UINavigationController *nava = [[UINavigationController alloc]initWithRootViewController:vc];
        [resultarr addObject:nava];
    }
    self.viewControllers = resultarr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
