//
//  ICToggleView.h
//  Clip-Pro
//
//  Created by vbn on 16/11/30.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

/**
 *  一个展开收起控件
 *
 *  更多定制请修改实现文件，因为我要吃饭了 - -
 */
#import <UIKit/UIKit.h>

@interface KNToggleView : UIControl

@property (assign, nonatomic,getter=isOn) BOOL on;

// default is 0.25
@property (assign, nonatomic) NSTimeInterval animationDuration;

// default is 展开
@property (copy, nonatomic) NSString *expandString;

// default is 收起
@property (copy, nonatomic) NSString *closedString;

- (void)setStatus:(BOOL)status animated:(BOOL)animated;

@end
