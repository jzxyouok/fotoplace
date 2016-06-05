//
//  HotFotoItemView.m
//  fotoplace
//
//  Created by MBP on 16/6/5.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HotFotoItemView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define kHotTagTitleTextColor [UIColor colorWithRed:255.0/255.0 green:218.0/255.0 blue:185.0/255.0 alpha:1.0]

@implementation HotFotoItemView


- (id)initWithHotFotoItem:(HotFotoItem *)item {
    if (self == [super init]) {
        self.item = item;
        [self initiliaze];
    }
    return self;
}

- (void)initiliaze {
    
    
}

- (void)setup {
    __weak typeof(self) weakself = self;
    
    NSURL * url = [NSURL URLWithString:self.item.imgPath];
    UIImageView * img = [UIImageView new];
    [img sd_setImageWithURL:url placeholderImage:nil];
    [self addSubview:img];
    
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself);
        make.top.equalTo(weakself);
        make.right.equalTo(weakself);
        make.bottom.equalTo(weakself);
    }];
    
    NSURL * avatarURL = [NSURL URLWithString:self.item.avatar];
    UIImageView * avatar = [UIImageView new];
    [avatar sd_setImageWithURL:avatarURL placeholderImage:nil];
    [self addSubview:avatar];
    avatar.layer.masksToBounds = YES;
    
    UILabel * lt = [UILabel new];
    lt.text = self.item.name;
    lt.textColor = [UIColor whiteColor];
    [self addSubview:lt];
    [lt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatar.mas_right).with.offset(10);
        make.centerY.equalTo(avatar.mas_centerY);
    }];
    NSLog(@"type:%ld",self.type);
    switch (self.type) {
        case HotFotoItemViewTypeSmall:
            [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@10);
                make.top.equalTo(@10);
                make.width.equalTo(@20);
                make.height.equalTo(@20);
            }];
            lt.font = [UIFont systemFontOfSize:12];
            avatar.layer.cornerRadius = 10.0;
            break;
        case HotFotoItemViewTypeLarge:
            [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@20);
                make.top.equalTo(@20);
                make.width.equalTo(@40);
                make.height.equalTo(@40);
            }];
            lt.font = [UIFont systemFontOfSize:15];
            avatar.layer.cornerRadius = 20.0;
            break;
        default:
            break;
    }

}

- (void)layoutSubviews {
    [self setup];
}

//- (HotFotoItemType)type {
//    
//    return self.type;
//}

@end
