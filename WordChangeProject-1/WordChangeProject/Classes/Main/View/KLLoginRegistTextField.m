//
//  KLLoginRegistTextField.m
//  WordChangeProject
//
//  Created by kailun on 17/4/18.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLLoginRegistTextField.h"

@implementation KLLoginRegistTextField

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor =[UIColor whiteColor];
   
    
    [self addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
 

}

-(void)beginEdit{
    self.placeholderColor=[UIColor whiteColor];
}

-(void)endEdit{
    self.placeholderColor=[UIColor grayColor];
}


@end
