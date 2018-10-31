//
//  UIApplication+DZTPushAction.m
//  DZTPushActionTool
//
//  Created by YYDD on 2018/10/31.
//  Copyright © 2018年 com.chuang.global. All rights reserved.
//

#import "UIApplication+DZTPushAction.h"
#import <objc/runtime.h>


@implementation UIApplication (DZTPushAction)

- (void)setCurrentViewController:(UIViewController *)currentViewController {
    if (!currentViewController) {
        //set nil的时候 移除
        objc_setAssociatedObject(self, @selector(currentViewController), nil, OBJC_ASSOCIATION_ASSIGN);
    }
    
    if (![currentViewController isKindOfClass:[UIViewController class]]) {
        return;
    }
    
    if (!currentViewController.navigationController) {
        return;
    }
    
    objc_setAssociatedObject(self, @selector(currentViewController), currentViewController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewController *)currentViewController {
    UIViewController *vc = objc_getAssociatedObject(self, _cmd);
    if (vc == nil) {
        vc = [UIApplication topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    return vc;
}

- (UINavigationController *)dzt_navigationController {
    if (self.currentViewController.navigationController) {
        return self.currentViewController.navigationController;
    }else if ([UIApplication navigationControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController]) {
        return [UIApplication navigationControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }else {
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if ([UIApplication navigationControllerWithRootViewController:window.rootViewController]) {
                return [UIApplication navigationControllerWithRootViewController:window.rootViewController];
            }
        }
    }
    return nil;
}

+ (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)rootViewController {
    if (rootViewController.presentedViewController) {
        UINavigationController *nav = [self navigationControllerWithRootViewController:rootViewController.presentedViewController];
        if (nav) {
            return nav;
        }
    }
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        UINavigationController *nav = [self navigationControllerWithRootViewController:tabBarController.selectedViewController];
        if (nav) {
            return nav;
        }
    }
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController*)rootViewController;
    }
    
    return rootViewController.navigationController;
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}


@end
