//
//  TTBubbleView.h
//  TTGameCenter
//
//  Created by TonyTong on 15/3/6.
//  Copyright (c) 2015年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  TTBubbleViewDelegate <NSObject>

- (void)bubbleDidClickForTypeWithPresent:(UIControl *)control;

@end

@interface TTBubbleView : UIView

@property (strong, nonatomic) UIControl            *frontView;
@property (strong, nonatomic) UILabel              *textLabel;
@property (nonatomic        ) BOOL                 isGameCenterAnimation;
@property (nonatomic        ) id<TTBubbleViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color title:(NSString *)title;

- (void)AddAniamtionLikeGameCenterBubble;
- (void)RemoveAniamtionLikeGameCenterBubble;
- (BOOL)isGameCenterAnimation;



@end
