//
//  KLCommentModel.h
//  WordChangeProject
//
//  Created by WTFKL on 17/5/27.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KLUserModel;
@interface KLCommentModel : NSObject

@property (copy,nonatomic) NSString *content;
@property(nonatomic,strong) KLUserModel *user;

@end
