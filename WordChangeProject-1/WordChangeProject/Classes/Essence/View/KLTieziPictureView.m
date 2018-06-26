//
//  KLTieziPictureView.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/31.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLTieziPictureView.h"
#import <YYWebImage/YYWebImage.h>
#import <DALabeledCircularProgressView.h>
#import <IDMPhotoBrowser.h>
@interface KLTieziPictureView()
@property (weak, nonatomic) IBOutlet YYAnimatedImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPicture;
@property (weak, nonatomic) IBOutlet  DALabeledCircularProgressView *centerProgressView;
@property(nonatomic,strong) IDMPhotoBrowser *browser;

@end

@implementation KLTieziPictureView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask =UIViewAutoresizingNone;
}

-(IDMPhotoBrowser *)browser{
    if (!_browser) {
        IDMPhoto *photoObj=[IDMPhoto photoWithURL:[NSURL URLWithString:self.topic_modle.image2]];
        NSMutableArray *photos =[NSMutableArray arrayWithObject:photoObj];
        IDMPhotoBrowser *browser =[[IDMPhotoBrowser alloc]initWithPhotos:photos];
        browser.disableVerticalSwipe=YES;
        browser.dismissOnTouch=YES;
        _browser=browser;
    }
    return _browser;
}

-(void)setTopic_modle:(KLTieziModel *)topic_modle{
    _topic_modle =topic_modle;
    [self.backgroundImage yy_setImageWithURL:[NSURL URLWithString:topic_modle.image0] placeholder:nil options:YYWebImageOptionShowNetworkActivity progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.centerProgressView.hidden =NO;
        CGFloat progress =1.0 * receivedSize / expectedSize;
        self.centerProgressView.progress=progress;
        self.centerProgressView.progressLabel.text=[NSString stringWithFormat:@"%.1f%%",progress*100];
        self.centerProgressView.progressLabel.textColor =[UIColor whiteColor];

    } transform:nil completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        self.centerProgressView.hidden=YES;
    }];

    
    if (topic_modle.is_gif) {
        self.gifImage.hidden=NO;
        self.seeBigPicture.hidden=YES;
    }else{
        if (topic_modle.isBigPicture) {
            self.gifImage.hidden=YES;
            self.seeBigPicture.hidden=NO;
            self.backgroundImage.contentMode=UIViewContentModeScaleAspectFill ;
            self.backgroundImage.clipsToBounds =YES;
        }else{
            self.seeBigPicture.hidden=YES;
            self.gifImage.hidden=YES;
        }
    }
}
#pragma mark - 点击查看大图
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //查看大图self.browser;
    [self.window.rootViewController presentViewController:self.browser animated:YES completion:nil];
}

@end
