//
//  ViewController.m
//  TTGameCenter
//
//  Created by TonyTong on 15/3/6.
//  Copyright (c) 2015年 TonyTong. All rights reserved.
//

#import "TTMainViewController.h"
#import "TTBubbleView.h"
#import "TTDetailViewController.h"
@interface TTMainViewController ()<TTBubbleViewDelegate,TTDetailViewControllerDelegate>
{
    TTBubbleView *bubbleView;
    NSArray      *viewsFrame;
}
@end

@implementation TTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect1   = CGRectMake(self.view.frame.size.width/2-60,self.view.frame.size.height/2-60,120, 120);
    CGRect rect2   = CGRectMake(rect1.origin.x-40,rect1.origin.y-20,60, 60);
    CGRect rect3   = CGRectMake(rect1.origin.x+rect1.size.width-30,rect1.origin.y-30,60, 60);
    CGRect rect4   = CGRectMake(rect1.origin.x-30,rect1.origin.y+90,70, 70);
    CGRect rect5   = CGRectMake(rect1.origin.x+rect1.size.width-30,rect1.origin.y+rect1.size.height-30,50, 50);

    UIColor *color1 = [UIColor colorWithRed:0.99 green:0.24 blue:0.62 alpha:0.800];
    UIColor *color2 = [UIColor colorWithRed:0.99 green:0.62 blue:0.16 alpha:0.900];
    UIColor *color3 = [UIColor colorWithRed:0.15 green:0.68 blue:0.98 alpha:0.900];
    UIColor *color4 = [UIColor colorWithRed:0.58 green:0.31 blue:0.98 alpha:0.900];
    UIColor *color5 = [UIColor colorWithRed:0.40 green:0.82 blue:0.27 alpha:0.900];
    
    NSArray *textArray = [[NSArray alloc]initWithObjects:@"回合",@"朋友",@"挑战",@"邀请",@"游戏", nil];
     viewsFrame= [[NSArray alloc]initWithObjects:NSStringFromCGRect(rect2),NSStringFromCGRect(rect3),NSStringFromCGRect(rect4),NSStringFromCGRect(rect5),NSStringFromCGRect(rect1), nil];
    NSArray *viewsColor = [[NSArray alloc]initWithObjects:color2,color3,color4,color5,color1, nil];
    for (int i = 0; i < viewsFrame.count; i++) {
        bubbleView =[[TTBubbleView alloc]initWithFrame:CGRectFromString(viewsFrame[i]) color:viewsColor[i] title:textArray[i]];
        bubbleView.tag = 100+i;
        bubbleView.frontView.tag = 1000+i;
        bubbleView.delegate = self;
        [self.view addSubview:bubbleView];
    }

    
    
    
    UIButton *buttonStart = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonStart setTitle:@"开始动画" forState:UIControlStateNormal];
    buttonStart.backgroundColor = [UIColor colorWithRed:0.254 green:0.651 blue:1.000 alpha:1.000];
    buttonStart.frame = CGRectMake(20, [UIScreen mainScreen].bounds.size.height-50, 100, 40);
    [buttonStart addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonStart.tag = 10000;
    [self.view addSubview:buttonStart];
    
    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonStop setTitle:@"停止动画" forState:UIControlStateNormal];
    buttonStop.backgroundColor = [UIColor colorWithRed:0.254 green:0.651 blue:1.000 alpha:1.000];
    buttonStop.tag = 10001;
    buttonStop.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-120, [UIScreen mainScreen].bounds.size.height-50, 100, 40);
    [buttonStop addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
    
}
- (void)bubbleDidClickForTypeWithPresent:(UIControl *)control
{
    TTDetailViewController *vc = [[TTDetailViewController alloc]init];
    vc.delegate = nil;
    vc.delegate = self;
    [UIView animateWithDuration:0.3 animations:^{
        UIButton *button = (UIButton *)[self.view viewWithTag:10000];
        [self buttonDidClick:button];
    }completion:^(BOOL finished) {
        [self presentViewController:vc animated:YES completion:nil];
    }];
}
- (void)buttonDidClickForTypeWithDismiss
{
    UIButton *button = (UIButton *)[self.view viewWithTag:10001];
    [self buttonDidClick:button];
}
- (void)buttonDidClick:(UIButton *)button
{
    if (button.tag == 10000) {
        
        for (int i = 0 ; i<5; i++) {
            
            TTBubbleView *bubbleV = (TTBubbleView *)[self.view viewWithTag:100+i];
            [UIView animateKeyframesWithDuration:.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                if (bubbleV.tag%2 ==0 && i!=4) {
                    
                    bubbleV.frame = CGRectMake(bubbleV.frame.origin.x-180, bubbleV.frame.origin.y+60, bubbleV.frame.size.width, bubbleV.frame.size.height);
                }else if(bubbleV.tag%2 ==1 && i!=4){
                    bubbleV.frame = CGRectMake(bubbleV.frame.origin.x+180, bubbleV.frame.origin.y+60, bubbleV.frame.size.width, bubbleV.frame.size.height);
                }else{
                    bubbleV.frame = CGRectMake(bubbleV.frame.origin.x, bubbleV.frame.origin.y+400, bubbleV.frame.size.width, bubbleV.frame.size.height);
                }
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }else{
        for (int i = 0 ; i<viewsFrame.count; i++) {
            
            TTBubbleView *bubbleV = (TTBubbleView *)[self.view viewWithTag:100+i];
            
            [UIView animateKeyframesWithDuration:.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                bubbleV.frame =CGRectFromString(viewsFrame[i]);
            } completion:^(BOOL finished) {
                
//                CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//                animation.keyPath = @"position.x";
//                animation.values = @[ @0, @10, @-10, @10, @0 ];
//                animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
//                animation.duration = 0.4;
//                animation.additive = YES;
//                [bubbleV.layer addAnimation:animation forKey:@"animation"];
                
            }];
        }
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
