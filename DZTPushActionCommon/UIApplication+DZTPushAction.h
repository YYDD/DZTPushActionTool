//
//  UIApplication+DZTPushAction.h
//  DZTPushActionTool
//
//  Created by YYDD on 2018/10/31.
//  Copyright © 2018年 com.chuang.global. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (DZTPushAction)

@property (nonatomic, weak) UIViewController *currentViewController;

@property (nonatomic, weak) UINavigationController *dzt_navigationController;


@end

NS_ASSUME_NONNULL_END
