//
//  RootViewController.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "RootViewController.h"
#import "openNum.h"
#import "TabBarViewController.h"
#import "AppDelegate.h"
#import "NewView.h"
@interface RootViewController ()
@property (nonatomic,strong)UIImageView *adBgImageView;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //判断是否是第一次打开
    if ([openNum isFirstLoadApp]) {
         [self showNew];
        
    }else {
        [self showAD];
    }
}


- (void)showAD{
    //显示广告
    //启动图拿过来 作为背景
    UIImage *image = [UIImage imageNamed:@"LaunchImage"];
    
    UIImageView *adBgImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.adBgImageView = adBgImageView;
    adBgImageView.image = image;
    [self.view addSubview:adBgImageView];
    
    UIButton *butn = [UIButton buttonWithType:UIButtonTypeSystem];
    butn.frame = CGRectMake(self.view.frame.size.width-80,20,50 ,30);
    [butn setTitle:@"跳过" forState:UIControlStateNormal];
    butn.titleLabel.font = [UIFont systemFontOfSize:20];
    [butn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:butn];
    butn.tag = 100;
    [butn addTarget:self action:@selector(skipNextpage:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-120, 25, 40, 20)];
    lable.text = @"4";
    lable.font = [UIFont systemFontOfSize:20];
    lable.textColor = [UIColor redColor];
    lable.tag = 101;
    [self.view addSubview:lable];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeNum) userInfo:nil repeats:YES];
    
    [_timer setFireDate:[NSDate distantPast]];
    

}


- (void)changeNum {
    UILabel *lable = (UILabel *)[self.view viewWithTag:101];
    static int a=5;
    a--;
    NSString *strNum = [NSString stringWithFormat:@"%d",a];
    lable.text = strNum;
    if ([lable.text isEqualToString:@"0"]) {
        _adBgImageView.alpha = 0;
        [_adBgImageView removeFromSuperview];
        UIButton *butn1 = (UIButton *)[self.view viewWithTag:100];
        [butn1 removeFromSuperview];
        [lable removeFromSuperview];
        //跳过广告以后 直接进入程序的主界面
        [self showNew];
    }
    
}

- (void)skipNextpage:(UIButton *)butn {
    //跳过按钮的事件

        _adBgImageView.alpha = 0;
        [_adBgImageView removeFromSuperview];
        UIButton *butn1 = (UIButton *)[self.view viewWithTag:100];
        [butn1 removeFromSuperview];
        //跳过广告以后 显示新特性
        [self showNew];
        //当点击跳过按钮  后  会删除 计时器
        [_timer invalidate];
        

}

- (void)goMain{
    //在这里需要去判断 程序需要进入那个界面
    //1 强登录  判断是否已经登录
    //2 不用登录
    
    TabBarViewController *tabBarVC = [[TabBarViewController alloc]init];
    //直接改变 window 的根视图控制器
    AppDelegate *app =  [UIApplication sharedApplication].delegate;
    app.window.rootViewController = tabBarVC;
}


//显示软件新特性
- (void)showNew{
    NSArray *imageNameArr = @[@"userGuide0.jpg",@"userGuide1.jpg",@"userGuide2.jpg",@"userGuide3.jpg"];

//        NSArray *imageNameArr = @[@"LaunchImage-568h",@"LaunchImage-568h",@"LaunchImage-568h",@"LaunchImage-568h"];
//    
    NewView *view = [[NewView alloc]initWithImageArray:imageNameArr iscomeFormUrl:NO frame:self.view.frame callBack:^{
        NSLog(@"立即体验按钮被点击");
        [self goMain];
    }];

    [self.view addSubview:view];
    
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
