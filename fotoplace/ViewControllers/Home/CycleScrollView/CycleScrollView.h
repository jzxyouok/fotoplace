//
//  CycleScrollView.h
//  fotoplace
//
//  Created by MBP on 16/5/22.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CycleScrollView : UIView

- (id)initWithURL:(NSArray*)urls;

@property (nonatomic)CGFloat cycleDotHeight;

@property (nonatomic)CGFloat cycleDotSpacing;

@property (nonatomic)CGFloat cycleDotWidth;

@property (nonatomic,strong)NSMutableArray * imgURL;

@end
