//
//  KLWebViewController.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/2.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLWebViewController.h"

@interface KLWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation KLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (IBAction)backClick:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardClick:(id)sender {
    [self.webView goForward];
    
}

- (IBAction)refeshClick:(id)sender {
    [self.webView reload];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    self.backItem.enabled=[self.webView canGoBack];
    self.forwardItem.enabled=[self.webView canGoForward];
}

@end
