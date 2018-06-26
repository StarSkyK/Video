//
//  KLRefreshHeader.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/16.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLRefreshHeader.h"

@implementation KLRefreshHeader

-(void)prepare{
    [super prepare];
    [self setTitle:@"正在刷新。。。" forState:MJRefreshStateRefreshing];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    self.automaticallyChangeAlpha=YES;
}

@end
