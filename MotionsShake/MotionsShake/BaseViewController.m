//
//  BaseViewController.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [[UINavigationBar appearance ]setTitleTextAttributes:dic];
    
    if (self.navigationController.viewControllers.count>1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonPrsss)];
    }
}

- (void)backBarButtonPrsss {
    [self.navigationController popoverPresentationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
