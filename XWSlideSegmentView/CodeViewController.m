//
//  CodeViewController.m
//  XWSlideSegmentView
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2014年 viviwu. All rights reserved.
//

#import "CodeViewController.h"
#import "XWSlideSegmentView.h"  
#import "DemoCollectionController.h"
#import "Header.h"

@interface CodeViewController()<XWSegSelectDelegate>

@property (nonatomic, copy) NSArray* channels;
@property (nonatomic, strong) XWSlideSegmentView * slideSegView;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, assign) CGFloat safeTop;
@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     
    // Do any additional setup after loading the view.
}

-(void)viewWillLayoutSubviews{
    
    _channels = @[@"要闻", @"推荐", @"自选", @"7x24", @"财富号", @"个股", @"看盘", @"大盘", @"提示", @"头条"];
    UIEdgeInsets safeArea = UIEdgeInsetsZero;
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        safeArea = self.view.safeAreaInsets;
    } else {
        // Fallback on earlier versions
    }
#endif
    _safeTop = safeArea.top;
    NSLog(@"self.safeTop==%f", self.safeTop);
    _slideSegView = [[XWSlideSegmentView alloc]initWithFrame: CGRectMake(0, self.safeTop, kSelfVB_W, 35.0) Titles:_channels];
    _slideSegView.backgroundColor = [UIColor whiteColor];
    _slideSegView.selectedColor = UIColor.orangeColor;
    _slideSegView.selectDelegate = (id)self;
    [self.view addSubview:_slideSegView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.safeTop + 35.0, kSelfVB_W, kSelfVB_H-35.0)];
    self.scrollView.contentSize = CGSizeMake(kSelfVB_W*_channels.count, 0);
    [self.view addSubview:self.scrollView];
    //    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    
    [self addSubViewControllers];
    
    [self.view bringSubviewToFront:_slideSegView];
    
    [super viewWillLayoutSubviews];
}
//- (void)viewWillLayoutSubviews{
//    [super viewWillLayoutSubviews];
//}

- (void)addSubViewControllers{
    if (self.scrollView) {
        for (int i=0; i<_channels.count; i++) {
            DemoCollectionController * vc = [[DemoCollectionController alloc]init];
            [vc.view setFrame:CGRectMake(kSelfVB_W*i, 0, kSelfVB_W, kSelfVB_H-35.0)];
            [self.scrollView addSubview: vc.view];
            [self addChildViewController: vc];
        }
        self.scrollView.delegate = (id)self;
    }
}

#pragma mark--XWSegSelectDelegate

-(void)longPressToDeleteItem:(NSArray*)newtitles
{
    NSLog(@"%s-->%@", __func__, newtitles);
}
- (void)didSelectedItemAtIndex:(NSInteger)index
{
    NSLog(@"%s---index=%ld", __func__, (long)index);
    //     [self.scrollView scrollRectToVisible:CGRectMake(kSelfVB_W*index, self.safeTop + 35.0, kSelfVB_W, kSelfVB_H-35.0) animated:YES];
    [self.scrollView setContentOffset:CGPointMake(kSelfVB_W * index, 0) animated:YES];
}

- (void)addNewChannelAction{
    NSLog(@"%s", __func__);
}

#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger selected = offsetX/kSelfVB_W;;
    //    NSLog(@"selected==%ld \n offsetX==%f", (long)selected, offsetX);
    
    if (offsetX >= 0 && offsetX <= kSelfVB_W*self.channels.count ) {
        selected = offsetX/kSelfVB_W;
    }else if(offsetX<-kSelfVB_W*0.35){
        selected = self.channels.count-1;
        [self.scrollView scrollRectToVisible:CGRectMake(kSelfVB_W*selected, 0, kSelfVB_W, kSelfVB_H) animated:YES];
    }else if(offsetX>kSelfVB_W*(self.channels.count-0.65)){
        selected = 0;
        [self.scrollView scrollRectToVisible:CGRectMake(kSelfVB_W*selected, 0, kSelfVB_W, kSelfVB_H) animated:YES];
    }else{
    }
    
    self.slideSegView.selectedIndex = selected;
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
