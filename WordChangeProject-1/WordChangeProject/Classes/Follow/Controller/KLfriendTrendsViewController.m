//
//  KLfriendTrendsViewController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/1.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLfriendTrendsViewController.h"
#import "KLLoginRegistViewController.h"
@interface KLfriendTrendsViewController ()
- (IBAction)LogBtnClick;

@end

@implementation KLfriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    self.navigationItem.leftBarButtonItem =[KLItemManager itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self aciton:@selector(leftBtnClick)];
    
}

-(void)leftBtnClick{
    
}

- (IBAction)LogBtnClick {
    KLLoginRegistViewController *logVc =[[KLLoginRegistViewController alloc] init];
    [self presentViewController:logVc animated:YES completion:nil];
}
@end
