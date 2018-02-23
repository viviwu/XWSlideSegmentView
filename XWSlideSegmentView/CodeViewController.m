//
//  CodeViewController.m
//  XWSlideSegmentView
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2014年 viviwu. All rights reserved.
//

#import "CodeViewController.h"
#import "XWSlideSegmentView.h"  

@interface CodeViewController()<XWSegSelectDelegate>
@property(nonatomic, strong)XWSlideSegmentView * segCtr;
@end

@implementation CodeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)longPressToDeleteItem:(NSArray*)newtitles
{
    NSLog(@"%s-->%@", __func__, newtitles);
}
- (void)didSelectedItemAtIndex:(NSInteger)index
{
    NSLog(@"%s---%ld", __func__, (long)index);
}

- (void)addNewChannelAction{
    NSLog(@"%s", __func__);
}

- (IBAction)deleteSelectedItem:(id)sender {
    if (_segCtr) {
        NSArray * titles=[_segCtr deleteSelectedItem];
        NSLog(@"%@", titles);
    }
}

- (IBAction)addItem:(id)sender {
    if (_segCtr) {
        [_segCtr addnewItemTitle:@"NewItem"];
    }
}
- (IBAction)addItems:(id)sender {
    if (_segCtr) {
        [_segCtr addNewItemsTitles:@[@"张三", @"李四", @"王五"]];
    }
}

- (IBAction)initSegCtr:(id)sender {
    if (nil==_segCtr) {
        _segCtr=[[XWSlideSegmentView alloc]initWithFrame:CGRectMake(0, 164.0, 320.0, 35.0) Titles:@[@"一", @"二", @"三"]];
    }
    _segCtr.backgroundColor=[UIColor orangeColor];
    _segCtr.isSeparated=YES;
    _segCtr.selectDelegate=(id)self;
    [self.view addSubview:_segCtr];
        _segCtr.titles= @[@"苹果",@"香蕉",@"橘子",@"葡萄",@"西瓜"];
    _segCtr.selectHandle=^(NSInteger selectedIndex){
        NSLog(@"%s==%ld",__func__,  (unsigned long)selectedIndex);
    };
}


@end
