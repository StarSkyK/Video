//
//  KLTopicVoiceView.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/31.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTopicVoiceView.h"
#import <YYWebImage/YYWebImage.h>
#import <DALabeledCircularProgressView.h>
@interface KLTopicVoiceView()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *playCounts;
@property (weak, nonatomic) IBOutlet UILabel *playTime;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *centerProgressView;

@end

@implementation KLTopicVoiceView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask =UIViewAutoresizingNone;
}
-(void)setTopic_modle:(KLTieziModel *)topic_modle{
    _topic_modle =topic_modle;
    self.playCounts.text =[NSString stringWithFormat:@"%zd次播放",topic_modle.playcount];
    NSInteger minite =topic_modle.voicetime/60;
    NSInteger second =topic_modle.voicetime%60;
    self.playTime.text =[NSString stringWithFormat:@"%02zd:%02zd",minite,second];
    
    [self.backgroundImage yy_setImageWithURL:[NSURL URLWithString:topic_modle.image0] placeholder:nil options:YYWebImageOptionShowNetworkActivity progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.centerProgressView.hidden =NO;
        CGFloat progress =1.0 * receivedSize / expectedSize;
        self.centerProgressView.progress=progress;
        self.centerProgressView.progressLabel.text=[NSString stringWithFormat:@"%.1f%%",progress*100];
        self.centerProgressView.progressLabel.textColor =[UIColor whiteColor];
        
    } transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        self.centerProgressView.hidden=YES;
    }];
   
}
@end
