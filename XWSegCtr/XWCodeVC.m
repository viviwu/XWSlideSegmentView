//
//  XWCodeVC.m
//  XWSegCtr
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import "XWCodeVC.h"
#import "XWSegCtr.h"  

@interface XWCodeVC()<TouchLabelDelegate>
@property(nonatomic, strong)XWSegCtr * segCtr;
@end

@implementation XWCodeVC
- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)SelectedItemWithIndex:(NSInteger)index
{
    NSLog(@"%s---%ld", __func__, (long)index);
}

- (IBAction)initSegCtr:(id)sender {
    
    _segCtr=[[XWSegCtr alloc]initWithFrame:CGRectMake(0, 164.0, 320.0, 35.0) Titles:@[@"一", @"二", @"三", @"四",@"五"]];
    _segCtr.backgroundColor=[UIColor yellowColor];
    _segCtr.titleColor=[UIColor redColor];
    _segCtr.titleSelectedColor=[UIColor purpleColor];
    _segCtr.touchDelegate=(id)self;
    [self.view addSubview:_segCtr];
    //    _segCtr.titles= @[@"苹果",@"香蕉",@"橘子",@"葡萄",@"西瓜"];
    _segCtr.selectedIndexHandle=^(NSInteger selectedIndex){
        NSLog(@"%s==%ld",__func__,  (unsigned long)selectedIndex);
    };
}

@end
