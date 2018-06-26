//
//  KLSettingViewController.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/3.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLSettingViewController.h"
#import <SDImageCache.h>
#import "KLClearCacheCell.h"
@interface KLSettingViewController ()

@end

@implementation KLSettingViewController

static NSString * const KLClearCacheCellID=@"KLClearCacheCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"设置";
    [self.tableView registerClass:[KLClearCacheCell class] forCellReuseIdentifier:KLClearCacheCellID];
}


-(instancetype)init{
    if (self =[super init]) {
       self= [self initWithStyle:UITableViewStyleGrouped];
    }
    return self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KLClearCacheCell *cell =[tableView dequeueReusableCellWithIdentifier:KLClearCacheCellID];
    
    return cell;
}

@end
