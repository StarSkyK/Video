//
//  KLClearCacheCell.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/4.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLClearCacheCell.h"
#import <SDImageCache.h>
#import "SVProgressHUD.h"
#define KL_FUllPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]
@implementation KLClearCacheCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIActivityIndicatorView *loadingView =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView =loadingView;
        //    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
        __weak typeof(self) weakSelf =self;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSString *apdPath =KL_FUllPath;
            unsigned long long DataSize =apdPath.sizeForfile;
            DataSize +=[SDImageCache sharedImageCache].getSize;
            NSString *SizeText =nil;
            self.textLabel.text =@"正在计算缓存大小。。。";
            self.userInteractionEnabled=NO;
            
            if (DataSize>=pow(10, 9)) {
                SizeText = [NSString stringWithFormat:@"%.2fGB",DataSize/pow(10, 9)];
            }else if (DataSize>=pow(10, 6)){
                SizeText = [NSString stringWithFormat:@"%.2fMB",DataSize/pow(10, 6)];
            }else if (DataSize>=pow(10, 3)){
                SizeText = [NSString stringWithFormat:@"%.2fKB",DataSize/pow(10, 3)];
            }else{
                SizeText = [NSString stringWithFormat:@"%zdB",DataSize];
            }
            
            NSString *text =[NSString stringWithFormat:@"清除缓存(%@)",SizeText];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.textLabel.text=text;
                weakSelf.accessoryView=nil;
                weakSelf.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
                
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(cleatCaches)]];
                weakSelf.userInteractionEnabled=YES;
            });
            
        });
        
      
    }
    return self;
}

-(void)cleatCaches{
//    [SVProgressHUD showWithStatus:@"正在清除缓存" maskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        NSFileManager *FMG =[NSFileManager defaultManager];
        [FMG removeItemAtPath:KL_FUllPath error:nil];
        [FMG createDirectoryAtPath:KL_FUllPath withIntermediateDirectories:YES attributes:nil error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            self.textLabel.text =@"清除缓存(0MB)";
        });
        
    }];
}

@end
