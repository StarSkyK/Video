//
//  KLItemManager.h
//  WordChangeProject
//
//  Created by kailun on 17/4/11.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KLItemManager : NSObject
+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target aciton:(SEL)action;
@end
