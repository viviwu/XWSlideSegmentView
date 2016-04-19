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
    _segCtr.titleColor=[UIColor redColor]; 
    _segCtr.touchDelegate=(id)self;
    _segCtr.selectedIndex=2;
    _segCtr.titles= @[@"苹果",@"香蕉",@"橘子",@"葡萄",@"西瓜"];
    _segCtr.selectedIndexHandle=^(NSInteger selectedIndex){
        NSLog(@"selectedIndex==%ld", (unsigned long)selectedIndex);
    };
  
    _collectionView.hidden=NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)deleteSelectedItem:(id)sender {
    if (_segCtr) {
        NSArray * titles=[_segCtr deleteSelectedItem];
        NSLog(@"%@", titles);
    }
}

-(void)longPressToDeleteItem:(NSArray*)newtitles
{
    NSLog(@"%s-->%@", __func__, newtitles);
}
- (IBAction)addItem:(UIBarButtonItem *)sender {
    
    [_segCtr addnewItemTitle:@"新来的"];
}

- (void)didSelectedItemAtIndex:(NSInteger)index
{
    NSLog(@"didSelectedItemAtIndex==%ld", (long)index);
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
