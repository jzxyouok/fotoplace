//
//  HTItemView.m
//  fotoplace
//
//  Created by MBP on 16/5/28.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HTItemView.h"
#import "UIImageView+Webcache.h"
#import "ImgUtil.h"
#import "Masonry.h"

@interface HTItemView ()

@property (nonatomic,strong)HotTagItem * item;
@end
@implementation HTItemView

- (id)initWithItem:(HotTagItem *)item {
    if (self == [super init]) {
        _item = item;
        [self initilaize];
    }
    return self;
}

- (void)initilaize {
    
    [self setup];
}

- (void)setup {
    __weak typeof(self) weakself = self;

    UIImageView * bg = [UIImageView new];
    [bg sd_setImageWithURL:[NSURL URLWithString:_item.imgPath] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UIImage * newimg = [ImgUtil getSubImage:image mCGRect:CGRectMake(0, 0, 200, 200) centerBool:YES];
        [bg setImage:newimg];
    }];
    [self addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(weakself.mas_top);
        make.bottom.equalTo(weakself.mas_bottom);
    }];
    
    UILabel * title = [UILabel new];
    title.text = [NSString stringWithFormat:@"#%@",_item.title];
    title.textAlignment = NSTextAlignmentCenter;
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
