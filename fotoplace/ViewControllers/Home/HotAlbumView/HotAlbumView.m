//
//  HotAlbumView.m
//  fotoplace
//
//  Created by MBP on 16/5/31.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HotAlbumView.h"
#import "HotTagItem.h"
#import "HTItemView.h"

#define kHotTagTitleTextColor [UIColor colorWithRed:255.0/255.0 green:218.0/255.0 blue:185.0/255.0 alpha:1.0]


@interface HotAlbumView ()

@property (nonatomic,strong)UIImageView * bgImg;
@property (nonatomic,strong)NSDictionary * data;

@end

@implementation HotAlbumView

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)data {
    if (self == [super initWithFrame:frame]) {
        self.data = data;
        [self initilaize];
    }
    return self;
}

- (void)initilaize {
    
    __weak typeof(self) weakself = self;
    
    UILabel * lt = [UILabel new];
    lt.text = @"热 门 影 集";
    lt.textColor = kHotTagTitleTextColor;
    lt.font = [UIFont systemFontOfSize:15];
    [self addSubview:lt];
    [lt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(@0);
        make.height.equalTo(@15);
    }];

    
    UIImageView * img = [UIImageView new];
    NSArray * list = [self.data objectForKey:@"albumListItemDtos"];
    if (list && [list count]>0) {
        NSDictionary * first = [list objectAtIndex:0];
        [img sd_setImageWithURL:[NSURL URLWithString:[first objectForKey:@"homePic"]] placeholderImage:nil];
    }
    [self addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(lt.mas_bottom).with.offset(20);
        make.height.equalTo(@200);
    }];
    
    NSDictionary * dic1 = [list objectAtIndex:1];
    NSDictionary * dic2 = [list objectAtIndex:2];
    NSDictionary * dic3 = [list objectAtIndex:3];

    HotTagItem * item1 = [[HotTagItem alloc] init];
    item1.title = [dic1 objectForKey:@"title"];
    item1.imgPath = [dic1 objectForKey:@"homePic"];
    HotTagItem * item2 = [[HotTagItem alloc] init];
    item2.title = [dic2 objectForKey:@"title"];
    item2.imgPath = [dic2 objectForKey:@"homePic"];
    HotTagItem * item3 = [[HotTagItem alloc] init];
    item3.title = [dic3 objectForKey:@"title"];
    item3.imgPath = [dic3 objectForKey:@"homePic"];
    
    HTItemView * iview1 = [[HTItemView alloc] initWithItem:item1];
    [self addSubview:iview1];
    HTItemView * iview2 = [[HTItemView alloc] initWithItem:item2];
    [self addSubview:iview2];
    HTItemView * iview3 = [[HTItemView alloc] initWithItem:item3];
    [self addSubview:iview3];
    
    [iview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(iview2.mas_left).with.offset(-2);
        make.top.equalTo(img.mas_bottom).with.offset(2);
        make.bottom.equalTo(weakself.mas_bottom);
        make.width.equalTo(iview2);
        make.height.equalTo(iview2);
    }];
    [iview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iview1);
        make.bottom.equalTo(weakself.mas_bottom);
        make.right.equalTo(iview3.mas_left).with.offset(-2);
        make.width.equalTo(iview3);
        make.height.equalTo(iview3);
    }];
    [iview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iview1);
        make.bottom.equalTo(weakself.mas_bottom);
        make.right.equalTo(weakself.mas_right);
    }];

    
    
}


@end
