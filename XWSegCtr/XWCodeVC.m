//
//  XWCodeVC.m
//  XWSegCtr
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import "XWCodeVC.h"
#import "XWSegCtr.h"  

@interface XWCodeVC()<XWSegSelectDelegate>
@property(nonatomic, strong)XWSegCtr * segCtr;
@end

@implementation XWCodeVC
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
        _segCtr=[[XWSegCtr alloc]initWithFrame:CGRectMake(0, 164.0, 320.0, 35.0) Titles:@[@"一", @"二", @"三"]];
    }
    _segCtr.backgroundColor=[UIColor orangeColor];
    _segCtr.isSeparated=YES;
    _segCtr.touchDelegate=(id)self;
    [self.view addSubview:_segCtr];
        _segCtr.titles= @[@"苹果",@"香蕉",@"橘子",@"葡萄",@"西瓜"];
    _segCtr.selectedIndexHandle=^(NSInteger selectedIndex){
        NSLog(@"%s==%ld",__func__,  (unsigned long)selectedIndex);
    };
}


@end
