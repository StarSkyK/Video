//
//  KLMeViewController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/1.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLMeViewController.h"
#import "KLMeViewCell.h"
#import "KLMeFooterView.h"
#import "KLSettingViewController.h"
@interface KLMeViewController ()

@end

@implementation KLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"我的";
    
    [self setUpTableView];
    [self setUpBarBtn];
    
}



-(void)setUpTableView{
    self.tableView.sectionHeaderHeight=0;
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset =UIEdgeInsetsMake(-25, 0, 0, 0);
    
    KLMeFooterView *footerView =[[KLMeFooterView alloc] init];
    self.tableView.tableFooterView =footerView;
}


-(void)setUpBarBtn{
    UIBarButtonItem *settingBtn =[KLItemManager itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self aciton:@selector(settingClick)];
    UIBarButtonItem *moonBtn =[KLItemManager itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self aciton:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems =@[settingBtn,moonBtn];

}



-(void)settingClick{
    KLSettingViewController *settingVc =[[KLSettingViewController alloc] init];
    
    [self.navigationController pushViewController:settingVc animated:YES];
}

-(void)moonClick{
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    KLMeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果没有，则创建
    if(cell == nil) {
        cell = [[KLMeViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.section==0) {
        cell.textLabel.text=@"登录/注册";
        cell.imageView.image=[UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text =@"离线下载";
        cell.imageView.image=nil;
    }
    
    
    
    return cell;
}


@end
