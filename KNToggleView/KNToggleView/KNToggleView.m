//
//  ICToggleView.m
//  Clip-Pro
//
//  Created by vbn on 16/11/30.
//  Copyright © 2016年 cqhxz. All rights reserved.
//

#import "KNToggleView.h"
#import "UIView+HZExtension.h"

@interface KNToggleView ()

@property (strong, nonatomic) UIView *containerView;

@property (strong, nonatomic) UILabel *expandLabel;

@property (strong, nonatomic) UILabel *closeLabel;

@property (strong, nonatomic) UIView *indicator;

@end

@implementation KNToggleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))/2;
    self.animationDuration = 0.25;
    self.expandString = @"展开";
    self.closedString = @"收起";
    [self addSubview:self.containerView];
    self.containerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds)*2, CGRectGetHeight(self.bounds));
    [self.containerView addSubview:self.expandLabel];
    [self.containerView addSubview:self.closeLabel];
    [self.containerView addSubview:self.indicator];
    self.expandLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.containerView.bounds));
    self.indicator.frame = CGRectMake(CGRectGetMaxX(self.expandLabel.frame), 1, CGRectGetHeight(self.bounds) - 1, CGRectGetHeight(self.containerView.bounds) - 2);
    self.closeLabel.frame = CGRectMake(CGRectGetMaxX(self.indicator.frame), 0, CGRectGetWidth(self.containerView.bounds) - CGRectGetMaxX(self.indicator.frame) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.containerView.bounds));
    self.indicator.layer.cornerRadius = CGRectGetWidth(self.indicator.bounds)/2;
}

- (void)setStatus:(BOOL)status animated:(BOOL)animated {
    [self setStatus:status animated:animated needSendAction:YES];
}

- (void)setStatus:(BOOL)status animated:(BOOL)animated needSendAction:(BOOL)needSendAction {
    if (status) {
        if (animated) {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.containerView.frame = CGRectMake(-CGRectGetWidth(self.bounds) + CGRectGetWidth(self.indicator.bounds) + 2, 0, CGRectGetWidth(self.bounds)*2, CGRectGetHeight(self.bounds));
            } completion:^(BOOL finished) {
                
            }];
        } else {
            self.containerView.frame = CGRectMake(-CGRectGetWidth(self.bounds) + CGRectGetWidth(self.indicator.bounds) + 2, 0, CGRectGetWidth(self.bounds)*2, CGRectGetHeight(self.bounds));
        }
        
    } else {
        if (animated) {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.containerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds)*2, CGRectGetHeight(self.bounds));
            } completion:^(BOOL finished) {
                
            }];
        } else {
            self.containerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds)*2, CGRectGetHeight(self.bounds));
        }
        
    }
    self.on = status;
    if (needSendAction) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self setStatus:!self.on animated:YES needSendAction:YES];
}

- (UIColor*)colorWithHex:(long)hexColor
{
    return [self colorWithHex:hexColor alpha:1];
}

- (UIColor*)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

#pragma mark - getter && setter

- (void)setExpandString:(NSString *)expandString {
    _expandString = expandString;
    self.expandLabel.text = expandString;
}

- (void)setClosedString:(NSString *)closedString {
    _closedString = closedString;
    self.closeLabel.text = closedString;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [self colorWithHex:0xc8c8c8];
    }
    return _containerView;
}

- (UILabel *)expandLabel
{
    if (!_expandLabel) {
        _expandLabel = [[UILabel alloc] init];
        _expandLabel.font = [UIFont systemFontOfSize:12];
        _expandLabel.textColor = [UIColor whiteColor];
        _expandLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _expandLabel;
}

- (UILabel *)closeLabel
{
    if (!_closeLabel) {
        _closeLabel = [[UILabel alloc] init];
        _closeLabel.font = [UIFont systemFontOfSize:12];
        _closeLabel.textColor = [UIColor whiteColor];
        _closeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _closeLabel;
}

- (UIView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIView alloc] init];
        _indicator.layer.shadowOffset = CGSizeMake(0, 0.5);
        _indicator.layer.shadowColor = [UIColor blackColor].CGColor;
        _indicator.layer.shadowOpacity = 0.5;
        _indicator.backgroundColor = [UIColor whiteColor];
    }
    return _indicator;
}

@end
