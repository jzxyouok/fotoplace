//
//  HotFotoItemView.h
//  fotoplace
//
//  Created by MBP on 16/6/5.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotFotoItem.h"

typedef NS_ENUM(NSInteger,HotFotoItemType) {
    HotFotoItemViewTypeSmall = 0,
    HotFotoItemViewTypeLarge = 1
};

@interface HotFotoItemView : UIView

@property (nonatomic,strong)HotFotoItem * item;

@property (nonatomic)HotFotoItemType type;

- (id)initWithHotFotoItem:(HotFotoItem*)item;


@end
