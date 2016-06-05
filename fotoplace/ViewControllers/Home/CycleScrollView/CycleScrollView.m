//
//  CycleScrollView.m
//  fotoplace
//
//  Created by MBP on 16/5/22.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "CycleScrollView.h"
#import "FPCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

NSString * const ID = @"cycleCell";
#define UISCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)


@interface CycleScrollView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl * pageControl;


@property (nonatomic,strong)UICollectionView * collectionView;

@property (nonatomic,strong)UICollectionViewFlowLayout * flowLayout;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic)NSInteger totalIndex;
@end

@implementation CycleScrollView

- (id)initWithFrame:(CGRect)frame urls:(NSArray *)urls {
    if (self == [super initWithFrame:frame]) {
        _imgURL = [NSMutableArray arrayWithArray:urls];
        [self initilaize];
    }
    return self;
}

- (id)initWithURL:(NSArray *)urls {
    if (self == [super init]) {
        _imgURL = [NSMutableArray arrayWithArray:urls];
        [self initilaize];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (!self) { return nil; }
    
    [self initilaize];
    return self;
}

- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(UISCREEN_WIDTH, 200);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[FPCollectionCell class] forCellWithReuseIdentifier:ID];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _collectionView = mainView;
    
    UIView * superview = self;
    
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top);
        make.bottom.equalTo(superview.mas_bottom);
        make.left.equalTo(superview.mas_left);
        make.right.equalTo(superview.mas_right);
        make.height.equalTo(superview.mas_height);
    }];
}

- (void)setupSegment {
    if ([_imgURL count] == 0 || [_imgURL count] == 1) {
        return;
    }
    if (_pageControl) {
        [_pageControl removeFromSuperview];
    }
    _pageControl = [[UIPageControl alloc] init];
    [_pageControl setNumberOfPages:[_imgURL count]];
    [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_pageControl];
}

- (void)initilaize {
    
    _cycleDotHeight = 20.0;
    _cycleDotSpacing = 15.0f;
    _totalIndex = [_imgURL count];
    [self setupCollectionView];
    [self setupSegment];
}


#pragma mark CollectionDataSource

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FPCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString * url = [NSString stringWithFormat:@"%@",[_imgURL objectAtIndex:indexPath.row]];
    [cell.collectionImg sd_setImageWithURL:[NSURL URLWithString:url]];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_imgURL count];
}


#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_pageControl setCurrentPage:[self currentPageIndex]];
    NSLog(@"currentPage%ld",[self currentPageIndex]);

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self setupTimer];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self invalidateTimer];
}

- (NSInteger)currentPageIndex {
    return _collectionView.contentOffset.x/_flowLayout.itemSize.width;
}

#pragma mark - actions

- (void)setupTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)automaticScroll {
    NSInteger  nextIndex = [self currentPageIndex] + 1;
    if (nextIndex >= _totalIndex) {
        nextIndex = 0;
    }
    NSLog(@"%ld",nextIndex);
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}
#pragma mark LayoutSubviews

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = CGSizeZero;
    size = CGSizeMake((_imgURL.count * (self.cycleDotSpacing + self.cycleDotWidth)) - self.cycleDotSpacing, _cycleDotHeight);
    CGFloat x = (self.frame.size.width - size.width) * 0.5;
    CGFloat y = (self.frame.size.height - size.height) - 10;

    [_pageControl setFrame:CGRectMake(x, y, size.width, size.height)];
}

@end
