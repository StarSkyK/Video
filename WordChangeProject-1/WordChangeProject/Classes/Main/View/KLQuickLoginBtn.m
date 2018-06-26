//
//  KLQuickLoginBtn.m
//  WordChangeProject
//
//  Created by kailun on 17/4/16.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLQuickLoginBtn.h"

@implementation KLQuickLoginBtn

-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.center =CGPointMake(self.width*0.5,self.height*0.5);

     CGFloat pX=0;
     CGFloat pY=self.imageView.bottom;
     CGFloat pW=self.width;
     CGFloat pH=20;
    
    self.titleLabel.frame =CGRectMake(pX,pY,pW,pH);

    
}

@end
