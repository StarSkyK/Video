//
//  KLEssenceViewController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/1.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLEssenceViewController.h"
#import "KLAllViewController.h"
#import "KLVideoViewController.h"
#import "KLVoiceViewController.h"
#import "KLPictureViewController.h"
#import "KLDzViewController.h"

@interface KLEssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak) UIButton *selectButton;
@property(nonatomic,weak) UIView *line;
@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UIView *titleView;

@end

@implementation KLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitleView];
    [self setupChildViewControllers];
    [self setScrollView];
    [self setTopButtonView];
    [self addChildVc];
    
}


-(void)leftBtnClick{
    
}



-(void)setupChildViewControllers{
    KLAllViewController *allVc =[[KLAllViewController alloc] init];
    [self addChildViewController:allVc];
    
    KLVideoViewController *videoVc =[[KLVideoViewController alloc] init];
    [self addChildViewController:videoVc];
    
    KLVoiceViewController *voiceVc =[[KLVoiceViewController alloc] init];
    [self addChildViewController:voiceVc];
    
    KLPictureViewController *pictureVc =[[KLPictureViewController alloc] init];
    [self addChildViewController:pictureVc];
    
    KLDzViewController *DzVc =[[KLDzViewController alloc] init];
    [self addChildViewController:DzVc];
    
    
}



-(void)setScrollView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIScrollView *scrollView =[[UIScrollView alloc] init];
    scrollView.frame =self.view.bounds;
    scrollView.pagingEnabled=YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    NSUInteger count =self.childViewControllers.count;
    scrollView.contentSize=CGSizeMake(count*scrollView.width, 0);
    [self.view addSubview:scrollView];
    self.scrollView =scrollView;
   self.scrollView.delegate=self;
    
    
//    for (NSUInteger i=0; i<count; i++) {
//        UITableView *childView =(UITableView *)self.childViewControllers[i].view;
//        childView.kl_x =i*childView.width;
//        childView.kl_y =0;
//        childView.contentInset =UIEdgeInsetsMake(64+35, 0,29,0);
//        childView.backgroundColor =XMGRandomColor;
//        [scrollView addSubview:childView];
//    }
   
 
}


-(void)setTopButtonView{
    UIView *TopButtonView =[[UIView alloc] init];
    TopButtonView.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.3];
    TopButtonView.frame=CGRectMake(0, 64, self.view.width, 35);
    [self.view addSubview:TopButtonView];
    //for 循环添加button
    NSArray *titles=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSInteger count =titles.count;
    CGFloat buttonW=self.view.width/count;
    CGFloat buttonH=TopButtonView.height;
    CGFloat buttonY=0;
    for (NSInteger i=0; i<count; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i;
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.frame=CGRectMake(i*buttonW, buttonY, buttonW, buttonH);
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(TopButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [TopButtonView addSubview:btn];
    }
    
    UIButton *templeBtn =TopButtonView.subviews.lastObject;
    UIButton *firstBtn =TopButtonView.subviews.firstObject;
    UIView *bottomLine =[[UIView alloc] init];
    bottomLine.backgroundColor =[templeBtn titleColorForState:UIControlStateSelected];
    bottomLine.height=1;
    bottomLine.kl_y=TopButtonView.height-bottomLine.height;
    
    [TopButtonView addSubview:bottomLine];
    
    [firstBtn.titleLabel sizeToFit];
    bottomLine.width=firstBtn.titleLabel.width;
    bottomLine.kl_centerX=firstBtn.kl_centerX;
    
    self.line=bottomLine;
    self.titleView=TopButtonView;
    //默认选中第一个
    [self TopButtonSelected:firstBtn];
    
}
-(void)TopButtonSelected:(UIButton *)titleBtn{
        self.selectButton.selected=NO;
        titleBtn.selected=YES;
        self.selectButton=titleBtn;
    
        [UIView animateWithDuration:0.25 animations:^{
            self.line.width=titleBtn.titleLabel.width;
            self.line.kl_centerX=titleBtn.kl_centerX;
        }];
    
        CGPoint contentSet = self.scrollView.contentOffset;
        contentSet.x=titleBtn.tag*self.scrollView.width;
        [self.scrollView setContentOffset:contentSet animated:YES];
}


-(void)setTitleView{
    self.navigationItem.titleView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem =[KLItemManager itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self aciton:@selector(leftBtnClick)];
}


#pragma mark scrollview代理方法
//滚动到指定位置同时创建控制器
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
   
    [self addChildVc];

}

-(void)addChildVc{
    NSUInteger index =self.scrollView.contentOffset.x/self.scrollView.width;
    UIViewController *childVc =self.childViewControllers[index];
    UITableView *tableView =(UITableView *)childVc.view;
    tableView.frame =self.scrollView.bounds;
    tableView.contentInset =UIEdgeInsetsMake(64+35, 0,49,0);
    tableView.backgroundColor =[UIColor lightGrayColor];
    [self.scrollView addSubview:childVc.view];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger index = scrollView.contentOffset.x/scrollView.width;
    UIButton *button =self.titleView.subviews[index];
    [self TopButtonSelected:button];
    [self addChildVc];
}
@end




























