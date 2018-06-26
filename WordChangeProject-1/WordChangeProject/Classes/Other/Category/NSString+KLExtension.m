//
//  NSString+KLExtension.m
//  WordChangeProject
//
//  Created by WTFKL on 17/5/3.
//  Copyright © 2017年 凯伦. All rights reserved.
//

#import "NSString+KLExtension.h"

@implementation NSString (KLExtension)
-(unsigned long long)sizeForfile{
    
    unsigned long long DataSize=0;
    
    NSFileManager *mgr =[NSFileManager defaultManager];
    
    NSDictionary *attrs =[mgr attributesOfItemAtPath:self error:nil];
    
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {
        NSDirectoryEnumerator *emunlator =[mgr enumeratorAtPath:self];
        for (NSString *path in emunlator) {
            NSString *fullpath =[self stringByAppendingPathComponent:path];
            DataSize +=[mgr attributesOfItemAtPath:fullpath error:nil].fileSize;
        }
    }else{
        DataSize =[mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    
    
    
    return DataSize;
}
@end
