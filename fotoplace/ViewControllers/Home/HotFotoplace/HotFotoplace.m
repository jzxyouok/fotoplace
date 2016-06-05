//
//  HotFotoplace.m
//  fotoplace
//
//  Created by MBP on 16/6/5.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HotFotoplace.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "HotFotoItemView.h"
#import "HotFotoItem.h"

#define kHotTagTitleTextColor [UIColor colorWithRed:255.0/255.0 green:218.0/255.0 blue:185.0/255.0 alpha:1.0]


@interface HotFotoplace ()

@property (nonatomic,strong)NSArray * datas;
@end

@implementation HotFotoplace

- (id)initWithData:(NSArray *)datas {
    if (self == [super init]) {
        self.datas = datas;
        [self initilaize];
    }
    return self;
}


- (void)initilaize {
    [self setup];
    
}

- (void)setup {
    
    __weak typeof(self) weakself = self;

    UILabel * lt = [UILabel new];
    lt.text = @"热 门 足 记";
    lt.textColor = kHotTagTitleTextColor;
    lt.font = [UIFont systemFontOfSize:15];
    [self addSubview:lt];
    [lt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(@0);
        make.height.equalTo(@15);
    }];
    
    if (self.datas && [self.datas count] > 0) {
        NSDictionary * data = [self.datas objectAtIndex:0];
        HotFotoItem * item = [[HotFotoItem alloc] init];
        item.avatar = [data objectForKey:@"avatar"];
        item.imgPath = [data objectForKey:@"postImg"];
        item.name = [data objectForKey:@"userName"];
        item.uid = [data objectForKey:@"uid"];
        
        HotFotoItemView * topImg = [[HotFotoItemView alloc] initWithHotFotoItem:item];
        topImg.type = HotFotoItemViewTypeLarge;
        [self addSubview:topImg];
        [topImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lt.mas_bottom).with.offset(20);
            make.left.equalTo(weakself.mas_left);
            make.right.equalTo(weakself.mas_right);
            make.height.equalTo(@200);
        }];
        
        //下面三个item
        NSDictionary * data1 = [self.datas objectAtIndex:1];
        NSDictionary * data2 = [self.datas objectAtIndex:2];
        NSDictionary * data3 = [self.datas objectAtIndex:3];

        HotFotoItem * item1 = [[HotFotoItem alloc] init];
        item1.avatar = [data1 objectForKey:@"avatar"];
        item1.imgPath = [data1 objectForKey:@"postImg"];
        item1.name = [data1 objectForKey:@"userName"];
        item1.uid = [data1 objectForKey:@"uid"];
        HotFotoItem * item2 = [[HotFotoItem alloc] init];
        item2.avatar = [data2 objectForKey:@"avatar"];
        item2.imgPath = [data2 objectForKey:@"postImg"];
        item2.name = [data2 objectForKey:@"userName"];
        item2.uid = [data2 objectForKey:@"uid"];
        HotFotoItem * item3 = [[HotFotoItem alloc] init];
        item3.avatar = [data3 objectForKey:@"avatar"];
        item3.imgPath = [data3 objectForKey:@"postImg"];
        item3.name = [data3 objectForKey:@"userName"];
        item3.uid = [data3 objectForKey:@"uid"];
        
        HotFotoItemView * view1 = [[HotFotoItemView alloc] initWithHotFotoItem:item1];
        HotFotoItemView * view2 = [[HotFotoItemView alloc] initWithHotFotoItem:item2];
        HotFotoItemView * view3 = [[HotFotoItemView alloc] initWithHotFotoItem:item3];
        view1.type = HotFotoItemViewTypeSmall;
        view2.type = HotFotoItemViewTypeSmall;
        view3.type = HotFotoItemViewTypeSmall;
        
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
        
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakself.mas_left);
            make.top.equalTo(topImg.mas_bottom).with.offset(2);
            make.bottom.equalTo(weakself.mas_bottom);
            make.width.equalTo(view2);
            make.height.equalTo(view2);
        }];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1.mas_right).with.offset(2);
            make.top.equalTo(view1.mas_top);
            make.bottom.equalTo(view1.mas_bottom);
            make.width.equalTo(view3);
            make.width.equalTo(view3);
        }];
        [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2.mas_right).with.offset(2);
            make.top.equalTo(view2.mas_top);
            make.right.equalTo(weakself.mas_right);
            make.bottom.equalTo(weakself.mas_bottom);
        }];

    }
}

@end
