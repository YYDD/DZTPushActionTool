//
//  DZTPushActionConfig.h
//  DZTPushActionTool
//
//  Created by YYDD on 2018/10/31.
//  Copyright © 2018年 com.chuang.global. All rights reserved.
//

#ifndef DZTPushActionConfig_h
#define DZTPushActionConfig_h

typedef enum : NSUInteger {
    DZTActionPush = 1,  //push操作
    DZTActionPop,       //pop操作
    DZTActionPresent,   //present操作
    DZTActionDisimss,   //dismissViewController 操作
} DZTActionType;




#define DZTRoutePushToVC(ViewController,beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
[nav pushViewController:ViewController animated:beAnimated];


#define DZTRoutePopVC(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
[nav popViewControllerAnimated:beAnimated]



#define DZTRoutePopToRoot(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
[nav popToRootViewControllerAnimated:beAnimated];



#define DZTRoutePopToVC(ViewController,beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
[nav popToViewController:ViewController animated:beAnimated];


#define DZTRoutePresentToVC(ViewController,beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
CATransition *transition = [CATransition animation];\
transition.duration = 0.35f;\
transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];\
transition.type = kCATransitionMoveIn;\
transition.subtype = kCATransitionFromTop;\
[nav.view.layer addAnimation:transition forKey:nil];\
[nav pushViewController:ViewController animated:NO];\


#define DZTRouteDismissToVC(beAnimated)\
UINavigationController *nav = [UIApplication sharedApplication].dzt_navigationController;\
CATransition *transition = [CATransition animation];\
transition.duration = 0.35f;\
transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];\
transition.type = kCATransitionReveal;\
transition.subtype = kCATransitionFromBottom;\
[nav.view.layer addAnimation:transition forKey:nil];\
[nav popViewControllerAnimated:NO];\



#endif /* DZTPushActionConfig_h */
