//
//  KLTabBarController.m
//  WordChangeProject
//
//  Created by kailun on 17/3/30.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTabBarController.h"
#import "KLTabBar.h"
#import "KLfriendTrendsViewController.h"
#import "KLnewViewController.h"
#import "KLMeViewController.h"
#import "KLEssenceViewController.h"
#import "KLNavigationController.h"
@interface KLTabBarController ()
@property (nonatomic, strong) UIButton *publishBtn;
@end

@implementation KLTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UITabBarItem *item =[UITabBarItem appearance];
    NSMutableDictionary *nodict =[NSMutableDictionary dictionary];
    nodict[NSForegroundColorAttributeName]=[UIColor grayColor];
    NSMutableDictionary *selectdict =[NSMutableDictionary dictionary];
    selectdict[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    [item setTitleTextAttributes:nodict forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectdict forState:UIControlStateSelected];
    
   
    
    
    [self addsubViewController:[[KLNavigationController alloc] initWithRootViewController:[[KLEssenceViewController alloc] init]] title:@"精华" selectImageName:@"tabBar_essence_click_icon" normalImage:@"tabBar_essence_icon"];
    [self addsubViewController:[[KLNavigationController alloc] initWithRootViewController:[[KLnewViewController alloc] init]]  title:@"新贴" selectImageName:@"tabBar_new_click_icon" normalImage:@"tabBar_new_icon"];
    [self addsubViewController:[[KLNavigationController alloc] initWithRootViewController:[[KLfriendTrendsViewController alloc] init]]  title:@"关注" selectImageName:@"tabBar_friendTrends_click_icon" normalImage:@"tabBar_friendTrends_icon"];
    [self addsubViewController:[[KLNavigationController alloc] initWithRootViewController:[[KLMeViewController alloc] initWithStyle:UITableViewStyleGrouped]] title:@"我" selectImageName:@"tabBar_me_click_icon" normalImage:@"tabBar_me_icon"];
    [self setValue:[[KLTabBar alloc] init] forKey:@"tabBar"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


-(void)addsubViewController:(UIViewController *)vc title:(NSString *)title selectImageName:(NSString *)selectImageName normalImage:(NSString *)imageName{
    vc.tabBarItem.title =title;
    vc.view.backgroundColor =[UIColor lightGrayColor];
    vc.tabBarItem.image =[UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage =[UIImage imageNamed:selectImageName];
    [self addChildViewController:vc];
}



@end















































