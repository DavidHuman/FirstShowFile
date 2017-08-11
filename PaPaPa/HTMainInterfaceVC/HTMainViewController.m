//
//  HTMainViewController.m
//  PaPaPa
//
//  Created by CHT on 2017/8/7.
//  Copyright © 2017年 chihaitao. All rights reserved.
//

#import "HTMainViewController.h"
#import "HTWhellViewController.h"
#import "SDCycleScrollView.h"
@interface HTMainViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    UIPageControl *_pageControl;
    UILabel *_label;
    NSMutableArray *_imageData;
    int _currentImageIndex;
    int _imageCount;
    NSTimer *_timer;
}
@end

@implementation HTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主界面";
    _imageData = @[].mutableCopy;
    //加载数据
    [self loadImageData];
  
    //添加滚动控件
    [self addScrollView];
   
    
}
- (IBAction)nextBtnClick:(id)sender {
    HTWhellViewController *vc = [[HTWhellViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



//加载数据
- (void)loadImageData{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param ql_setObject:kUserID forKey:@"wp_member_info_id"];
    [param ql_setObject:kToken forKey:@"token"];
    [param ql_setInterge:0 forKey:@"col_type"];
    [[HttpRequest sharedInstance] getWithURLString:kCommodityHome parameters:param success:^(id responseObject) {
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",resultDic);
        if (resultDic && [resultDic[@"success"] integerValue] == 1) {
            NSArray *imageArr = resultDic[@"root"];
            for (NSDictionary *modeDic in imageArr) {
                [_imageData addObject:[NSString stringWithFormat:@"%@%@",kFileUrl,modeDic[@"picture_url"]]];
            }
            _imageCount = (int)_imageData.count;
           
            //添加滚动控件
            [self addImageViews];
            //添加分页控件
            [self addPageControl];
            //加载默认图片
            [self setDefaultImage];
            
            
            
            
            
            //添加第三方的轮播图
            [self createViewWithNSArry:_imageData];
            
            
            
            
        }
    } failure:^(NSError *error) {
        SHOW_CONTENT(@"网络错误", self.view);
    }];
}

- (void)addScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, MainWidth, 180)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(3 * MainWidth, 60);
    //设置当前显示的位置为中间图片
    [_scrollView setContentOffset:CGPointMake(MainWidth, 0)];
    //设置分页
    _scrollView.pagingEnabled = YES;
    //去掉滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
}

- (void)addImageViews{
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, 180)];
    _leftImageView.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_leftImageView];
    
    _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MainWidth, 0, MainWidth, 180)];
    _centerImageView.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_centerImageView];
    
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MainWidth * 2, 0, MainWidth, 180)];
    _rightImageView.contentMode = UIViewContentModeScaleToFill;
    [_scrollView addSubview:_rightImageView];
    
}
- (void)addPageControl{
    _pageControl = [[UIPageControl alloc] init];
    //注意此方法可以根据页数放回UIPageControl合适的大小
    CGSize size = [_pageControl sizeForNumberOfPages:_imageCount];
    _pageControl.frame = CGRectMake((MainWidth - size.width) / 2, 240 - size.height, size.width, size.height);
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.numberOfPages = _imageCount;
    [self.view addSubview:_pageControl];
}
#pragma mark 滚动停止事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //重新加载图片
    [self reloadImage];
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(MainWidth, 0) animated:NO];
    //设置分页
    _pageControl.currentPage=_currentImageIndex;
}

#pragma mark 重新加载图片
- (void)reloadImage{
    int leftIamgeIndex,rightImageIndex;
    CGPoint offset = [_scrollView contentOffset];
    if (offset.x > MainWidth) {
        _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
    }else if(offset.x < MainWidth){
        _currentImageIndex = (_currentImageIndex + _imageCount - 1) % _imageCount;
    }
    [_centerImageView sd_setImageWithURL:[self imageStr:_imageData[_currentImageIndex]]  placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    //重新设置左右图片
    leftIamgeIndex = (_currentImageIndex + _imageCount - 1) % _imageCount;
    rightImageIndex = (_currentImageIndex + 1) % _imageCount;
    [_leftImageView sd_setImageWithURL:[self imageStr:_imageData[leftIamgeIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    [_rightImageView sd_setImageWithURL:[self imageStr:_imageData[rightImageIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    
}
- (NSURL *)imageStr:(NSString *)str{
    NSURL *url = [NSURL URLWithString:str];
    return url;
}

- (void)setDefaultImage{
    int leftIamgeIndex,rightImageIndex;
    _currentImageIndex=0;
    leftIamgeIndex = (_imageCount - 1) % _imageCount;
    rightImageIndex = (1) % _imageCount;
    [_centerImageView sd_setImageWithURL:[self imageStr:_imageData[_currentImageIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    [_leftImageView sd_setImageWithURL:[self imageStr:_imageData[leftIamgeIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    [_rightImageView sd_setImageWithURL:[self imageStr:_imageData[rightImageIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    
    _pageControl.currentPage=_currentImageIndex;
    
    
    //在这里打开定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startScroll:) userInfo:nil repeats:YES];
    NSRunLoop *maim = [NSRunLoop currentRunLoop];
    [maim addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}
- (void)startScroll:(NSTimer *)timer{
    int leftIamgeIndex,rightImageIndex;
    
    
    if (_currentImageIndex == _imageCount - 1) {
        _pageControl.currentPage = 0;
    } else if (_currentImageIndex < _imageCount - 1) {
        _pageControl.currentPage ++ ;
    }
    _currentImageIndex = (int)_pageControl.currentPage;
    [_centerImageView sd_setImageWithURL:[self imageStr:_imageData[_currentImageIndex]]  placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    //重新设置左右图片
    leftIamgeIndex = (_currentImageIndex + _imageCount - 1) % _imageCount;
    rightImageIndex = (_currentImageIndex + 1) % _imageCount;
    [_leftImageView sd_setImageWithURL:[self imageStr:_imageData[leftIamgeIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    [_rightImageView sd_setImageWithURL:[self imageStr:_imageData[rightImageIndex]] placeholderImage:[UIImage imageNamed:@"default_img"] options:SDWebImageRetryFailed];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    if (_timer) {
        [_timer invalidate];
        _timer=nil;
    }
}



#pragma mark 第三方轮播图
- (void)createViewWithNSArry:(NSArray *)imageArr{
    
    if (imageArr.count == 0) return;
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 250, MainWidth, MainWidth * 9 / 16) delegate:self placeholderImage:[UIImage imageNamed:@"default_img"]];
    
    cycleScrollView.imageURLStringsGroup = imageArr;
    cycleScrollView.autoScrollTimeInterval = 3.0f;
    [self.view addSubview:cycleScrollView];
    
    
}

@end
