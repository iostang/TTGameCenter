//
//  TTDetailViewController.h
//  TTGameCenter
//
//  Created by TonyTong on 15/3/9.
//  Copyright (c) 2015年 TonyTong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  TTDetailViewControllerDelegate <NSObject>
- (void)buttonDidClickForTypeWithDismiss;
@end
@interface TTDetailViewController : UIViewController
@property (nonatomic) id<TTDetailViewControllerDelegate> delegate;
@end
