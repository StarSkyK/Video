//
//  KLLoginRegistViewController.m
//  WordChangeProject
//
//  Created by kailun on 17/4/14.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "KLLoginRegistViewController.h"

@interface KLLoginRegistViewController ()
- (IBAction)close;
- (IBAction)RegistButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLeft;

@end

@implementation KLLoginRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
 
}

- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)RegistButton:(UIButton *)button {
    
    [self.view endEditing:YES];
    if (self.marginLeft.constant) {
        [button setTitle:@"注册账号" forState:UIControlStateNormal];
        self.marginLeft.constant=0;
    }else{
        [button setTitle:@"已有账号" forState:UIControlStateNormal];
        self.marginLeft.constant=-self.view.width;
    }
   
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}
@end
