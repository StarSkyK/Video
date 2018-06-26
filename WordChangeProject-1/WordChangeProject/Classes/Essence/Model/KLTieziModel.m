//
//  KLTieziModel.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/16.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTieziModel.h"
#import "NSCalendar+KLExtension.h"
#import "NSDate+KLExtension.h"
#import <MJExtension.h>
#import "KLCommentModel.h"
#import "KLUserModel.h"

@implementation KLTieziModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"top_cmt":[KLCommentModel class]};
}

-(NSString *)created_at{
 
    NSCalendar *calender =[NSCalendar calender];
    
    NSDateFormatter *fmt =[[NSDateFormatter alloc] init];
    fmt.dateFormat =@"yyyy-MM-dd HH:mm:ss";
    
    NSDate *createAtDate =[fmt dateFromString:_created_at];
    
    if (createAtDate.iskl_ThisYear) {//如果是今年
        if (createAtDate.iskl_Today) {//是不是在今天
            NSDate *nowdate =[NSDate date];
            NSCalendarUnit unit =NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond;
            NSDateComponents *comp =[calender components:unit fromDate:createAtDate toDate:nowdate options:0];
            
            if (comp.hour>=1) {
                return [NSString stringWithFormat:@"%zd小时前",comp.hour];
            }else if (comp.minute>=1){
                return [NSString stringWithFormat:@"%zd分钟前",comp.minute];
            }else{
                return [NSString stringWithFormat:@"刚刚"];
            }
            
        }else if(createAtDate.iskl_Yesterday){//是不是昨天
            fmt.dateFormat=@"昨天 HH:mm:ss";
            return [fmt stringFromDate:createAtDate];
        }else{//其他时间
            fmt.dateFormat =@"MM-dd HH:mm:ss";
            return [fmt stringFromDate:createAtDate];
        }
        
    }else{//如果不是今年
        
        fmt.dateFormat =@"yyyy-MM-dd";
        return [fmt stringFromDate:createAtDate];
    }
 
    
    return nil;
}

-(CGFloat)cellHeight{
    
    if (_cellHeight) {
        return _cellHeight;
    }
    
    //顶部
    _cellHeight =44+KLMargin;
    //文字
    CGFloat textMaxW =[UIScreen mainScreen].bounds.size.width-2*KLMargin;
    CGSize textMaxSize =CGSizeMake(textMaxW, MAXFLOAT);
//    CGSize textSize =[self.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:textMaxSize];
    CGSize textSize =[self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;

    _cellHeight +=textSize.height+KLMargin;
    //中间附加组件
    if(self.type != KLTopicTypeWord){
        CGFloat contentH = textMaxW * self.height/self.width;
        if (contentH>[UIScreen mainScreen].bounds.size.height) {
            contentH=200;
            self.bigPicture=YES;
        }
        self.contentFrame =CGRectMake(KLMargin, _cellHeight,textMaxW-KLMargin,contentH);
        _cellHeight += contentH + KLMargin;
    }
    //热评
    if (self.top_cmt) {
        //标题
        _cellHeight +=17;
        //文字
        NSString *hot_cmt =[NSString stringWithFormat:@"%@ :%@",self.top_cmt.user.username,self.top_cmt.content];
//        CGSize hotTextSize =[hot_cmt sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:textMaxSize];
       CGSize hotTextSize = [hot_cmt boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
        _cellHeight += hotTextSize.height + KLMargin;
        
    }
    
    //工具条
    _cellHeight+=44+2*KLMargin;
    
    
    return _cellHeight;
}


@end
