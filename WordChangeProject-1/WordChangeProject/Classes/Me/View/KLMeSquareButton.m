//
//  KLMeSquareButton.m
//  WordChangeProject
//
//  Created by WTFKL on 17/4/26.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLMeSquareButton.h"
#import <UIButton+WebCache.h>

@implementation KLMeSquareButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.titleLabel.textAlignment =NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font =[UIFont systemFontOfSize:14];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imageView.width=self.width*0.5;
    self.imageView.kl_y=self.height*0.15;
    self.imageView.height=self.imageView.width;
    self.imageView.kl_centerX=self.width*0.5;
    
    self.titleLabel.width=self.width;
    self.titleLabel.height = self.height*0.2;
    self.titleLabel.kl_x=0;
    self.titleLabel.kl_y=self.height-self.titleLabel.height*1.5;
}


-(void)setMeSquare:(KLMeSquareModel *)meSquare{
    _meSquare =meSquare;
    [self setTitle:meSquare.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:meSquare.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
    [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
}

@end
