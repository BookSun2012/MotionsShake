//
//  NewView.h
//  MotionsShake
//
//  Created by 周书阳 on 16/3/26.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BlockBack)(void);
@interface NewView : UIView
@property (nonatomic,copy)BlockBack back;

- (instancetype)initWithImageArray:(NSArray *)imageArray  iscomeFormUrl:(BOOL)isUrl frame:(CGRect)frame callBack:(BlockBack)back;

@end
