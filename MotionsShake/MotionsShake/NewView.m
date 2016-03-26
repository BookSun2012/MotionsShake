//
//  NewView.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "NewView.h"

@implementation NewView
- (instancetype)initWithImageArray:(NSArray *)imageArray iscomeFormUrl:(BOOL)isUrl frame:(CGRect)frame callBack:(BlockBack)back {
    if (self = [super init]) {
        self.frame = frame;
        [self creatScrollViewImageArray:imageArray iscomeFromeUrl:isUrl];
        self.back = back;
    }
    return  self;
}
- (void)creatScrollViewImageArray:(NSArray *)imageArray iscomeFromeUrl:(BOOL)isUrl{
    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(self.bounds.size.width*imageArray.count, self.bounds.size.height);
     scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    //创建图片视图
    for (int i=0; i<[imageArray count]; i++) {
        UIImage *image = [UIImage imageNamed:imageArray[i]];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
        if (i==1||i==3) {
            imageView.backgroundColor = [UIColor purpleColor];
        }
        [scrollView addSubview:imageView];
        
        if (isUrl) {
            //加载网络图片
            //加载网络图片
            //[imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]] placeholderImage:[UIImage imageNamed:@"placeholder@2x"]];
        }else {
            imageView.image = image;
        }
        
        
        //在最后一张图片上面添加按钮
        if (i==imageArray.count-1) {
            UIButton *goButn = [UIButton buttonWithType:UIButtonTypeCustom];
            goButn.frame = CGRectMake(300, 600, 75, 30);
            [goButn setTitle:@"立即体验" forState:UIControlStateNormal];
            [goButn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [imageView addSubview:goButn];
            imageView.userInteractionEnabled = YES;
            [goButn addTarget:self action:@selector(nextView:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
    }

}
//回调
- (void)nextView:(UIButton *)butn{
    _back();
}


@end
