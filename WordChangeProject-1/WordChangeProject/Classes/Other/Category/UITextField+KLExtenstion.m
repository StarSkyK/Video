//
//  UITextField+KLExtenstion.m
//  WordChangeProject
//
//  Created by kailun on 17/4/21.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "UITextField+KLExtenstion.h"

@implementation UITextField (KLExtenstion)


-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
}

-(UIColor *)placeholderColor{
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
}

@end
