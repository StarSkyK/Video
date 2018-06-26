//
//  KLNavigationController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/12.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLNavigationController.h"

@interface KLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation KLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate=self;
    //navigationbarBackgroundWhite
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count>0) {
        UIButton *backBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [backBtn sizeToFit];
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    }
    
     [super pushViewController:viewController animated:animated];
}



-(void)backBtnClick{
    [self popViewControllerAnimated:YES];
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.childViewControllers.count==1) {
        return NO;
    }
    return YES;
}
@end
