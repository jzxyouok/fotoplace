//
//  ImgUtil.h
//  fotoplace
//
//  Created by MBP on 16/5/29.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImgUtil : NSObject

+(UIImage*)getSubImage:(UIImage *)image mCGRect:(CGRect)mCGRect centerBool:(BOOL)centerBool;

@end
