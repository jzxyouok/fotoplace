//
//  FileUtil.m
//  fotoplace
//
//  Created by MBP on 16/5/28.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (id)readFile:(NSString *)str type:(NSString *)type {
    NSError*error;
    NSString *filePath = [[NSBundle mainBundle]pathForResource:str ofType:type];
     NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingAllowFragments error:&error];
    return jsonObject;
}

@end
