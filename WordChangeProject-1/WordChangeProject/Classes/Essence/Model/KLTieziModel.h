//
//  KLTieziModel.h
//  WordChangeProject
//
//  Created by WTFKL on 17/5/16.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KLCommentModel;
typedef NS_ENUM(NSInteger,KLTopicType){
    /** 图片*/
    KLTopicTypePicture =10,
    /** 段子*/
    KLTopicTypeWord =29,
    /** 声音*/
    KLTopicTypeVoice =31,
    /** 视频*/
    KLTopicTypeVideo=41,
    /** 全部*/
    KLTopicTypeAll=1
};

@interface KLTieziModel : NSObject
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *profile_image;
@property (copy,nonatomic) NSString *text;
@property (copy,nonatomic) NSString *created_at;

@property (assign,nonatomic) NSInteger ding;
@property (assign,nonatomic) NSInteger cai;
@property (assign,nonatomic) NSInteger repost;
@property (assign,nonatomic) NSInteger comment;
/**小图**/
@property (copy,nonatomic) NSString *image0;
/**中图**/
@property (copy,nonatomic) NSString *image1;
/**原图**/
@property (copy,nonatomic) NSString *image2;
/**测试**/
@property (copy,nonatomic) NSString *image_small;
/**是否为GIF*/
@property(nonatomic,assign) BOOL is_gif;
/**是否为大图*/
@property(nonatomic,assign,getter=isBigPicture) BOOL bigPicture;
/**音频时间*/
@property (assign,nonatomic) NSInteger voicetime;
/**视频时间*/
@property (assign,nonatomic) NSInteger videotime;
/**播放次数*/
@property (assign,nonatomic) NSInteger playcount;
/**视频url*/
@property (copy,nonatomic) NSString * videouri;

@property(nonatomic,strong) KLCommentModel *top_cmt;

@property(nonatomic,assign) KLTopicType type;
@property(nonatomic,assign) CGFloat width;
@property(nonatomic,assign) CGFloat height;
/** 自定义模型 */
@property(nonatomic,assign) CGFloat cellHeight;
@property(nonatomic,assign) CGRect contentFrame;




@end
