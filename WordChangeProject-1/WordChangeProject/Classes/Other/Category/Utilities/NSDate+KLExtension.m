//
//  NSDate+KLExtension.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/25.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "NSDate+KLExtension.h"

@implementation NSDate (KLExtension)
-(BOOL)iskl_ThisYear{
    NSCalendar *calender =[NSCalendar calender];
    NSInteger  year = [calender component:NSCalendarUnitYear fromDate:self];
    NSInteger  nowYear = [calender component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return year == nowYear;
}

-(BOOL)iskl_Today{
    NSCalendar *calendar =[NSCalendar calender];
    NSCalendarUnit unit =NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *comp =[calendar components:unit fromDate:self toDate:[NSDate date] options:0];
    
    return comp.year==0
        && comp.month==0
        && comp.day==0;
}

-(BOOL)iskl_Yesterday{
    NSDateFormatter *fmt =[[NSDateFormatter alloc] init];
    fmt.dateFormat =@"yyyyMMdd";
    //时分秒归零
    NSString *selfString =[fmt stringFromDate:self];
    NSString *nowString =[fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate =[fmt dateFromString:selfString];
    NSDate *nowDate =[fmt dateFromString:nowString];
    
    NSCalendar *calender =[NSCalendar calender];
    NSCalendarUnit unit =NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    NSDateComponents *comp =[calender components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comp.year==0
        && comp.month==0
        && comp.day==1;
}

-(BOOL)iskl_Tomorrow{
    NSDateFormatter *fmt =[[NSDateFormatter alloc] init];
    fmt.dateFormat =@"yyyyMMdd";
    //时分秒归零
    NSString *selfString =[fmt stringFromDate:self];
    NSString *nowString =[fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate =[fmt dateFromString:selfString];
    NSDate *nowDate =[fmt dateFromString:nowString];
    
    NSCalendar *calender =[NSCalendar calender];
    NSCalendarUnit unit =NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    NSDateComponents *comp =[calender components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comp.year==0
    && comp.month==0
    && comp.day==-1;
}

@end
