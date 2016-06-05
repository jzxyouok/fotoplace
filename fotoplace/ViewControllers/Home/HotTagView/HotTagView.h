//
//  HotTagView.h
//  fotoplace
//
//  Created by MBP on 16/5/28.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotTagView : UIView

- (id)initWithFrame:(CGRect)frame datas:(NSArray*)data;

@property (nonatomic,strong)UIColor * titleTextColor;

@property (nonatomic) CGFloat titleTextSize;

@property (nonatomic)CGFloat itemSpace;



@end
