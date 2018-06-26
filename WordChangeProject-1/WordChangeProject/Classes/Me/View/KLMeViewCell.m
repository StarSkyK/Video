//
//  KLMeViewCell.m
//  WordChangeProject
//
//  Created by kailun on 17/4/23.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLMeViewCell.h"

@implementation KLMeViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentMode=UIViewContentModeScaleAspectFit;
        self.backgroundView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.kl_y=KLSmallMargin;
    self.imageView.kl_x=KLSmallMargin;
    self.imageView.height=self.contentView.height-2*KLSmallMargin;
    self.textLabel.kl_x =self.imageView.right+KLSmallMargin;
}

@end
