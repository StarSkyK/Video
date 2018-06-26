//
//  KLTopicsCell.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/22.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTopicsCell.h"
#import <UIImageView+WebCache.h>
#import "KLCommentModel.h"
#import "KLUserModel.h"
#import "KLTieziPictureView.h"
#import "KLTopicVideoView.h"
#import "KLTopicVoiceView.h"
@interface KLTopicsCell()
@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *pingBtn;
@property (weak, nonatomic) IBOutlet UIView *hotPingView;
@property (weak, nonatomic) IBOutlet UILabel *hotText;

@property(nonatomic,weak) KLTopicVideoView *videoView;
@property(nonatomic,weak) KLTopicVoiceView *voiceView;
@property(nonatomic,weak) KLTieziPictureView *pictureView;

@end

@implementation KLTopicsCell

#pragma mark -懒加载

-(KLTopicVideoView *)videoView{
    if (!_videoView) {
        KLTopicVideoView *videoView =[KLTopicVideoView viewFromXib];
        [self addSubview:videoView];
        _videoView=videoView;
    }
    return _videoView;
}

-(KLTopicVoiceView *)voiceView{
    if (!_voiceView) {
        KLTopicVoiceView *voiceView =[KLTopicVoiceView viewFromXib];
        [self addSubview:voiceView];
        _voiceView =voiceView;
    }
    return _voiceView;
}

-(KLTieziPictureView *)pictureView{
    if (!_pictureView) {
        KLTieziPictureView *pictureView =[KLTieziPictureView viewFromXib];
        [self addSubview:pictureView];
        _pictureView =pictureView;
    }
    return _pictureView;
}


-(void)setModel:(KLTieziModel *)model{
    _model =model;
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text =model.name;
    self.createAtLabel.text=model.created_at;
    self.text_Label.text =model.text;
    
    [self setButton:self.dingBtn number:model.ding title:@"顶"];
    [self setButton:self.caiBtn number:model.cai title:@"踩"];
    [self setButton:self.zhuanBtn number:model.ding title:@"转"];
    [self setButton:self.pingBtn number:model.ding title:@"评论"];
    [self.moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //最热评论
  
    if (model.top_cmt) {
        self.hotPingView.hidden=NO;
        NSString *userName =model.top_cmt.user.username;
        NSString *content =model.top_cmt.content;
        self.hotText.text =[NSString stringWithFormat:@" %@:%@",userName,content];
      
    }else{
        self.hotPingView.hidden=YES;
    }
   
    
    if (model.type==KLTopicTypePicture) {
        self.pictureView.hidden=NO;
        self.pictureView.frame =model.contentFrame;
        self.pictureView.topic_modle =model;
        self.videoView.hidden=YES;
        self.voiceView.hidden =YES;
        
    }else if (model.type==KLTopicTypeWord){
        self.pictureView.hidden=YES;
        self.videoView.hidden=YES;
        self.voiceView.hidden =YES;
        
    }else if (model.type==KLTopicTypeVideo){
        self.videoView.hidden=NO;
        self.videoView.frame =model.contentFrame;
        self.videoView.topic_modle=model;
        self.pictureView.hidden=YES;
        self.voiceView.hidden =YES;
//       self.videoView.playerVc.view.hidden=YES;
        
    }else if (model.type==KLTopicTypeVoice){
        self.voiceView.hidden =NO;
        self.voiceView.frame=model.contentFrame;
        self.voiceView.topic_modle=model;
        self.pictureView.hidden=YES;
        self.videoView.hidden=YES;
        
    }
}


-(void)setButton:(UIButton *)button  number:(NSInteger)number title:(NSString *)title{
    if (number>=10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    }else if(number>=1){
         [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    }else{
         [button setTitle:title forState:UIControlStateNormal];
    }
}

-(void)moreBtnClick{
    UIAlertController *alertVc =[UIAlertController alertControllerWithTitle:@"你想做什么？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 =[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"收藏");
    }];
    UIAlertAction *action2 =[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"举报");
    }];
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertVc addAction:action1];
    [alertVc addAction:action2];
    [alertVc addAction:cancel];
    
    [self.window.rootViewController presentViewController:alertVc animated:YES completion:nil];
    
}


-(void)setFrame:(CGRect)frame{
    frame.size.height -= KLMargin;
    frame.size.width -=2*5;
    frame.origin.y +=KLMargin;
    frame.origin.x +=5;
    [super setFrame:frame];
}
@end
