//
//  KLnewViewController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/1.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLnewViewController.h"

@interface KLnewViewController ()

@end

@implementation KLnewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navigationItem.titleView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem =[KLItemManager itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self aciton:@selector(leftBtnClick)];
}


-(void)leftBtnClick{
    
}

@end
