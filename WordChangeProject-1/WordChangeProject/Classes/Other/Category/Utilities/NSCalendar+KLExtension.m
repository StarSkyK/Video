//
//  NSCalendar+KLExtension.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/25.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "NSCalendar+KLExtension.h"

@implementation NSCalendar (KLExtension)
+(instancetype)calender{
    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else{
        return [NSCalendar currentCalendar];
    }
}
@end
