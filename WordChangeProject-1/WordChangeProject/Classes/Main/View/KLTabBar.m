//
//  KLTabBar.m
//  WordChangeProject
//
//  Created by kailun on 17/4/1.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTabBar.h"

@interface KLTabBar ()
@property (nonatomic, weak) UIButton *publishBtn;
@end

@implementation KLTabBar

-(UIButton *)publishBtn{
    if (!_publishBtn) {
       UIButton *publishBtn =[[UIButton alloc] init];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateNormal];
        [publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishBtn];
        _publishBtn=publishBtn;
    }
    return _publishBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat subButtonW =self.frame.size.width/5;
    CGFloat subButtonH =self.frame.size.height;
    CGFloat subButtonY =0;
    int index=0;
    for (UIView *subButton  in self.subviews) {
        if ([subButton class] !=NSClassFromString(@"UITabBarButton")) continue;
        CGFloat subButtonX =subButtonW*index;
        if(index>=2){
            subButtonX+=subButtonW;
        }
        index++;
        subButton.frame=CGRectMake(subButtonX,subButtonY, subButtonW, subButtonH);
    }
    
    self.publishBtn.frame =CGRectMake(0, 0, subButtonW,subButtonH);
    self.publishBtn.center =CGPointMake(self.frame.size.width*0.5,  self.frame.size.height*0.5);
}

-(void)publishBtnClick{
   
}


@end
