//
//  HomeViewController.m
//  fotoplace
//
//  Created by MBP on 16/5/27.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "HomeViewController.h"
#import "CycleScrollView.h"
#import "HotTagView.h"
#import "CompliationView.h"
#import "FileUtil.h"
#import "HotAlbumView.h"
#import "HotFotoplace.h"

@interface HomeViewController () {
    
}
@property (nonatomic,strong)CycleScrollView * cycleView;
@property (nonatomic,strong)HotTagView * hotView;
@property (nonatomic,strong)CompliationView * compView;
@property (nonatomic,strong)HotAlbumView * hotAlbumView;
@property (nonatomic,strong)UIView * conView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakself = self;
    
    self.conView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.scrollView addSubview:self.conView];

    [self.conView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.scrollView.mas_top).with.offset(0);
        make.left.equalTo(weakself.scrollView.mas_left).with.offset(0);
        make.right.equalTo(weakself.scrollView.mas_right).with.offset(0);
        make.bottom.equalTo(weakself.scrollView.mas_bottom).with.offset(0);
        make.width.equalTo(weakself.scrollView.mas_width).with.offset(0);
    }];
    
    
    CycleScrollView * cv = [[CycleScrollView alloc] initWithURL:[NSMutableArray arrayWithArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/562c11dfa9ec8a130801d90df303918fa1ecc0c0.jpg"]]];
    [self.conView addSubview:cv];
    _cycleView = cv;
    [_cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.scrollView.mas_top).with.offset(0);
        make.left.equalTo(weakself.scrollView.mas_left).with.offset(0);
        make.right.equalTo(weakself.scrollView.mas_right).with.offset(0);
        make.height.equalTo(@200);
    }];
    
    NSDictionary * dic = [FileUtil readFile:@"HotTag" type:@"json"];
    NSArray * list = [[dic objectForKey:@"tags"] objectForKey:@"tagList"];
    HotTagView * view = [[HotTagView alloc] initWithFrame:CGRectZero datas:list];
    [self.conView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cv.mas_bottom).with.offset(20);
        make.left.equalTo(weakself.conView.mas_left).with.offset(0);
        make.right.equalTo(weakself.conView.mas_right).with.offset(0);
        make.height.equalTo(@120);
    }];
    
    CompliationView * cpv = [[CompliationView alloc] initWithFrame:CGRectZero data:@{@"postImg":@"http://dn.fotoplace.cc/45c3f6297a774fa6919baeac8f54281b.jpg-ms"}];
    [self.conView addSubview:cpv];
    [cpv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.conView.mas_left);
        make.right.equalTo(weakself.conView.mas_right);
        make.top.equalTo(view.mas_bottom).with.offset(20);
        make.height.equalTo(@200);
    }];

    HotAlbumView * hav = [[HotAlbumView alloc] initWithFrame:CGRectZero data:[dic objectForKey:@"hotAlbum"]];
    [self.conView addSubview:hav];
    [hav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cpv.mas_bottom).with.offset(20);
        make.left.equalTo(weakself.conView.mas_left);
        make.right.equalTo(weakself.conView.mas_right);
        make.height.equalTo(@342);
    }];
    
    HotFotoplace * fotoItemView = [[HotFotoplace alloc] initWithData:[[dic objectForKey:@"hotPost"] objectForKey:@"hotPostList"]];
    [self.conView addSubview:fotoItemView];
    [fotoItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hav.mas_bottom).with.offset(20);
        make.left.equalTo(weakself.conView.mas_left);
        make.right.equalTo(weakself.conView.mas_right);
        make.height.equalTo(@340);
        make.bottom.equalTo(weakself.conView.mas_bottom).with.offset(0);
    }];
    
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
