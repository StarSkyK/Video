//
//  KLMeFooterView.m
//  WordChangeProject
//
//  Created by kailun on 17/4/24.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLMeFooterView.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "KLMeSquareModel.h"
#import "KLMeSquareButton.h"
#import "KLWebViewController.h"
@interface KLMeFooterView()
@property(nonatomic,strong) NSMutableDictionary *TpDiction;
@property(nonatomic,strong) NSMutableArray *TpArray;


@end


@implementation KLMeFooterView

-(NSMutableDictionary *)TpDiction{
    if (!_TpDiction) {
        _TpDiction =[NSMutableDictionary dictionary];
    }
    return _TpDiction;
}

-(NSMutableArray *)TpArray{
    if (!_TpArray) {
        _TpArray=[NSMutableArray array];
    }
    return _TpArray;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor =[UIColor grayColor];
        NSMutableDictionary *parameter =[NSMutableDictionary dictionary];
        parameter[@"a"]=@"square";
        parameter[@"c"]=@"topic";
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
                       
            NSMutableArray *modelArray=[KLMeSquareModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            for (KLMeSquareModel *model in modelArray) {
                [self.TpDiction setObject:model forKey:model.name];
            }
            
            [self loadBtnMessage:self.TpDiction.allValues];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失败");
        }];
        
        
        
    }
    return self;
}

-(void)loadBtnMessage:(NSArray *)array{
   
    CGFloat buttonW  =self.width/4;
    CGFloat buttonH  =buttonW;
    for (int i=0; i<array.count; i++) {
        
      
        CGFloat buttonX  =(i % 4)*buttonW;
        CGFloat buttonY  = (i / 4)*buttonH;
        KLMeSquareButton *button =[KLMeSquareButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.meSquare =array[i];
        [button addTarget:self action:@selector(clicklistener:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
    self.height=self.subviews.lastObject.bottom;
    UITableView *tableView =(UITableView *)self.superview;
    tableView.tableFooterView=self;
    [tableView reloadData];
//    tableView.contentSize=CGSizeMake(0,self.bottom);

}

-(void)clicklistener:(KLMeSquareButton *)button{
    KLMeSquareModel *square =button.meSquare;
    if ([square.url hasPrefix:@"http"]) {
        KLWebViewController *vc =[[KLWebViewController alloc] init];
        vc.url=square.url;
        vc.navigationItem.title=button.currentTitle;
        UITabBarController *tabbarVc =(UITabBarController *)self.window.rootViewController;
        UINavigationController *nav =tabbarVc.selectedViewController;
        [nav pushViewController:vc animated:YES];
        NSLog(@"url");
    }else if([square.url hasPrefix:@"mod"]){
        NSLog(@"mod");
    }else{
        NSLog(@"其他");
    }
    

}
@end
