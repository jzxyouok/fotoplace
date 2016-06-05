//
//  HotTagView.m
//  fotoplace
//
//  Created by MBP on 16/5/28.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HotTagView.h"
#import "HTItemView.h"
#import "HotTagItem.h"
#import "Masonry.h"

#define kHotTagViewWidth   80
#define kHotTagViewHeight  80
#define kHotTagTitleHeight 15

#define kHotTagTitleTextColor [UIColor colorWithRed:255.0/255.0 green:218.0/255.0 blue:185.0/255.0 alpha:1.0]
@interface HotTagView ()

@property (nonatomic,weak)NSArray * datas;

@property (nonatomic,strong)UIView * contentView;

@property (nonatomic,strong)UIScrollView * scrollView;

@end

@implementation HotTagView

- (id)initWithFrame:(CGRect)frame datas:(NSArray *)data {
    if (self == [super initWithFrame:frame]) {
        _datas = data;
        [self initilaize];
        [self setupView];
        [self setupItems];
    }
    return self;
}

- (void)initilaize {
    _itemSpace = 15.0;
}

- (void)setupView {
    
    UILabel * lt = [UILabel new];
    lt.text = @"热 门 标 签";
    lt.textColor = kHotTagTitleTextColor;
    lt.font = [UIFont systemFontOfSize:15];
    [self addSubview:lt];
    [lt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(@0);
    }];
    
    UIButton * more = [UIButton buttonWithType:UIButtonTypeSystem];
//    [more setFrame:CGRectMake(200, 0, 100, 20)];
    [more setTitle:@"更多标签 >" forState:UIControlStateNormal];
    [more setTitle:@"更多标签 >" forState:UIControlStateHighlighted];
    [more setTitleColor:kHotTagTitleTextColor forState:UIControlStateNormal];
    [more setTitleColor:kHotTagTitleTextColor forState:UIControlStateHighlighted];
    [more.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self addSubview:more];

    __weak typeof(self) weakself = self;
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-10);
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

    UIScrollView * sv = [UIScrollView new];
    sv.backgroundColor = [UIColor clearColor];
    sv.scrollsToTop = YES;
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
    [self addSubview:sv];
    self.scrollView = sv;
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left);
        make.right.equalTo(weakself.mas_right);
        make.top.equalTo(more.mas_bottom).with.offset(20);
        make.bottom.equalTo(weakself.mas_bottom);
        
    }];
    
    self.contentView = [UIView new];
    [sv addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sv.mas_left).with.offset(0);
        make.right.equalTo(sv.mas_right).with.offset(0);
        make.top.equalTo(sv.mas_top).with.offset(0);
        make.bottom.equalTo(sv.mas_bottom).with.offset(0);
        make.height.equalTo(sv.mas_height).with.offset(0);
    }];
    
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.contentView.mas_left).with.offset(0);
        make.top.equalTo(weakself.contentView.mas_top);
        make.bottom.equalTo(weakself.contentView.mas_bottom);
        make.width.mas_equalTo([_datas count] * (kHotTagViewWidth + 10));
        make.right.equalTo(weakself.contentView.mas_right);
    }];
    
}

- (void)layoutSubviews {
    NSLog(@"contentwidth%f",self.scrollView.contentSize.width);
}


- (void)setupItems {
    HTItemView * lastView = nil;
    
    if ([_datas count] > 0) {
        for (int i = 0; i < [_datas count]; i++) {
            NSDictionary * dic = [_datas objectAtIndex:i];
            HotTagItem * item = [[HotTagItem alloc] init];
            item.title = [dic objectForKey:@"tagText"];
            item.imgPath = [dic objectForKey:@"imgUrl"];
            item.tagList = [dic objectForKey:@"list"];
            HTItemView * view = [[HTItemView alloc] initWithItem:item];
            [self.contentView addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top);
                make.width.equalTo(@kHotTagViewWidth);
                make.height.equalTo(@kHotTagViewWidth);
                make.left.mas_equalTo(i * (kHotTagViewWidth +10));
                make.bottom.equalTo(self.contentView.mas_bottom);
            }];
            lastView = view;
        }
    }
}


@end
