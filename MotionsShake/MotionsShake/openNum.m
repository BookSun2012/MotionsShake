//
//  openNum.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "openNum.h"

@implementation openNum
//记录应用程序的打开次数
+(void)recordAppLoadNum {
    NSInteger num = [[NSUserDefaults standardUserDefaults]integerForKey:@"openAppNum"];
    if (num == 0) {
        //说明是第一次打开程序
    }
    num++;
    [[NSUserDefaults standardUserDefaults]setInteger:num forKey:@"openAppNum"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"第%ld打开程序",num);
}

+(BOOL)isFirstLoadApp {
    NSInteger num = [[NSUserDefaults standardUserDefaults]integerForKey:@"openAppNum"];
    if (num == 1) {
        return YES;
    }else {
        return NO;
    }
}

@end
