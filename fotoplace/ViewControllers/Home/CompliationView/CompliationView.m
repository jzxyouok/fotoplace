//
//  CompliationView.m
//  fotoplace
//
//  Created by MBP on 16/5/30.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "CompliationView.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@interface CompliationView ()

@property (nonatomic,strong)NSDictionary * data;
@property (nonatomic,strong)UIImageView * bgImg;
@property (nonatomic,strong)UILabel * label;
@end

@implementation CompliationView

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)data {
    if (self == [super initWithFrame:frame]) {
        _data = data;
        [self initilaize];
    }
    return self;
}

- (void)initilaize {
    self.backgroundColor = [UIColor clearColor];
    [self setup];
}

- (void)setup {
    UIImageView * img = [UIImageView new];
    if (_data) {
        NSString * url = [_data objectForKey:@"postImg"];
        [img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    }
    [self addSubview:img];
    __weak typeof(self) weakself = self;

    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(weakself.mas_top);
        make.bottom.equalTo(weakself.mas_bottom);
    }];
    
    UILabel * title = [UILabel new];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"足迹精选";
    title.textColor = [UIColor whiteColor];
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(weakself.mas_top);
        make.bottom.equalTo(weakself.mas_bottom);
    }];

}


@end
