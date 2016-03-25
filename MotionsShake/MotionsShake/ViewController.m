//
//  ViewController.m
//  MotionsShake
//
//  Created by 周书阳 on 16/3/25.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController ()
@property (nonatomic,strong) UIAlertController *alertController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self resignFirstResponder];
//}
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"信息" preferredStyle:UIAlertControllerStyleAlert];
        self.alertController = alertController;
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.backgroundColor = [UIColor purpleColor];
        }];

        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消按钮被点击");

                [self playSounWithName:@"shake_match.wav"];

        }];

        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"确定按钮被单击");
            [self playSounWithName:@"shake_sound_male.wav"];
        }];
//        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//            NSLog(@"确定按钮被单击");
//            [self playSounWithName:@"shake_sound_male.wav"];
//        }];
        [alertController addAction:action1];
        [alertController addAction:action2];
//        [alertController addAction:action3];

        [self presentViewController:alertController animated:YES completion:nil];
        
        alertController.title = @"Are you sure Delete!";
        alertController.message = @"If you delete this ,you will don't find this file in the photos!";
        
        int random = arc4random()%2;
        if (random) {
            [self playSounWithName:@"shake_match.wav"];
        }else {
            [self playSounWithName:@"shake_sound_male.wav"];
        }
        
    }
}
/*
 又称“短音频”，通常在程序中的播放时长为1~2秒
 
 在应用程序中起到点缀效果，提升整体用户体验
 */
- (void)playSounWithName:(NSString *)soundName {
    NSArray *arr = [soundName componentsSeparatedByString:@"."];
    NSString *path = [[NSBundle mainBundle]pathForResource:arr[0] ofType:arr[1]];
    NSURL *url = [NSURL URLWithString:path];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlayAlertSound(soundID);
    
}




@end
