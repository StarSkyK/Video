//
//  KLItemManager.m
//  WordChangeProject
//
//  Created by kailun on 17/4/11.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLItemManager.h"

@implementation KLItemManager

+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target aciton:(SEL)action{
    UIButton *button =[[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    UIBarButtonItem *buttonItem =[[UIBarButtonItem alloc]initWithCustomView:button];
    return buttonItem;
}


@end
