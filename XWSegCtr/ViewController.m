//
//  ViewController.m
//  QQ:286218985
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import "ViewController.h"
#import "XWSegCtr.h"

@interface ViewController ()<TouchLabelDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet XWSegCtr *segCtr;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _segCtr.titleColor=[UIColor blueColor];
    _segCtr.titleSelectedColor=[UIColor purpleColor];
    _segCtr.touchDelegate=(id)self;
    
    _segCtr.titles= @[@"苹果",@"香蕉",@"橘子",@"葡萄",@"西瓜"];
    _segCtr.selectedIndexHandle=^(NSInteger selectedIndex){
        NSLog(@"selectedIndex==%ld", (unsigned long)selectedIndex);
    };
  
    _collectionView.hidden=NO;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addItem:(UIBarButtonItem *)sender {
    
    [_segCtr addnewItemTitle:@"新来的"];
}

- (void)SelectedItemWithIndex:(NSInteger)index
{
    NSLog(@"SelectedItemWithIndex==%ld", (long)index);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor  purpleColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
