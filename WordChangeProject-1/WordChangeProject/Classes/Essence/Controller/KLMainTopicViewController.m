//
//  KLMainTopicViewController.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/15.
//  Copyright © 2017年 凯伦. MainTopic rights reserved.
//

#import "KLMainTopicViewController.h"
#import "KLTieziModel.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "KLRefreshHeader.h"
#import "KLRefreshFooter.h"
#import "KLTopicsCell.h"
@interface KLMainTopicViewController ()
@property(nonatomic,strong) NSMutableArray<KLTieziModel *> *modelArray;
@property (copy,nonatomic) NSString *maxtime;
@property(nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation KLMainTopicViewController
static NSString *const KLTopicsCellID =@"KLTopicsCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    [self.tableView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"%@",[KLTopicsCell class]] bundle:nil] forCellReuseIdentifier:KLTopicsCellID];
    
}

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)setupRefresh{
    self.tableView.mj_header =[KLRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDataFromNet)];;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer =[KLRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
}


#pragma mark-加载网络数据
//从网上加载数据
-(void)loadDataFromNet{
    
    [self.manager.tasks  makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary *param =[NSMutableDictionary dictionary];
    param[@"a"]=@"newlist";
    param[@"c"]=@"data";
    param[@"type"]=@(self.type);
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/test/Desktop/aa.plist" atomically:YES];
        self.maxtime =responseObject[@"info"][@"maxtime"];
        self.modelArray =[KLTieziModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"返回数据失败"];
        [self.tableView.mj_header endRefreshing];
        
    }];
}
//加载更多
-(void)loadMoreData{
    
    [self.manager.tasks  makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *param =[NSMutableDictionary dictionary];
    param[@"a"]=@"newlist";
    param[@"c"]=@"data";
    param[@"type"]=@(self.type);
    param[@"maxtime"]=self.maxtime;
    
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.maxtime =responseObject[@"info"][@"maxtime"];
        [self.modelArray addObjectsFromArray:[KLTieziModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"返回数据失败"];
        [self.tableView.mj_footer endRefreshing];
        
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KLTopicsCell *cell =[tableView dequeueReusableCellWithIdentifier:KLTopicsCellID];
    cell.model =self.modelArray[indexPath.row];
    return cell;
    
}
-(KLTopicType)type{
    return 0;
}
#pragma mark -代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.modelArray[indexPath.row].cellHeight;
}



@end
















