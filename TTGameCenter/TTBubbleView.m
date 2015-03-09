//
//  TTBubbleView.m
//  TTGameCenter
//
//  Created by TonyTong on 15/3/6.
//  Copyright (c) 2015年 TonyTong. All rights reserved.
//

#import "TTBubbleView.h"

@implementation TTBubbleView

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frontView = [[UIControl alloc]initWithFrame:CGRectZero];
        self.frontView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _frontView.layer.cornerRadius = self.frame.size.width/2;
        _frontView.layer.masksToBounds = YES;
        _frontView.backgroundColor = color;
        [self addSubview:_frontView];
        [_frontView addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(_frontView.frame.size.width/2-20, _frontView.frame.size.height/2-20, 40, 40)];
        self.textLabel.text = title;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.frontView addSubview:self.textLabel];
        
        [self AddAniamtionLikeGameCenterBubble];
    }
    return self;
}
- (void)test:(UIControl *)control
{
    [self.delegate bubbleDidClickForTypeWithPresent:control];
}
//----类似GameCenter的气泡晃动动画------
-(void)AddAniamtionLikeGameCenterBubble{
    _isGameCenterAnimation = YES;
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 5.0;
    
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGRect circleContainer = CGRectInset(self.frontView.frame, self.frontView.bounds.size.width / 2 - 3, self.frontView.bounds.size.width / 2 - 3);
    CGPathAddEllipseInRect(curvedPath, NULL, circleContainer);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [self.frontView.layer addAnimation:pathAnimation forKey:@"myCircleAnimation"];
    
    
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = arc4random() %8+2;
    scaleX.values = @[@1.0, @1.05,@1.1, @1.0];
    scaleX.keyTimes = @[@0.0, @0.25,@0.5, @1.0];
    scaleX.repeatCount = INFINITY;
    scaleX.autoreverses = YES;
    scaleX.removedOnCompletion = NO;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.frontView.layer addAnimation:scaleX forKey:@"scaleXAnimation"];
    

    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = arc4random() %8+2;
    scaleY.values = @[@1.0, @1.05,@1.1, @1.0];
    scaleY.keyTimes = @[@0.0, @0.25,@0.5, @1.0];
    scaleY.repeatCount = INFINITY;
    scaleY.autoreverses = YES;
    scaleY.removedOnCompletion = NO;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.frontView.layer addAnimation:scaleY forKey:@"scaleYAnimation"];
}

-(void)RemoveAniamtionLikeGameCenterBubble{
    _isGameCenterAnimation = NO;
    [self.frontView.layer removeAllAnimations];
}


@end
