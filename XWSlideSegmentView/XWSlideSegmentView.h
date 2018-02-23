//
//  XWSlideSegmentView.h
//  Weibo: https://weibo.com/vivi705
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2014年 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XWSelectHandle)(NSInteger selectedIndex);

@protocol XWSegSelectDelegate <NSObject>

- (void)didSelectedItemAtIndex:(NSInteger)index;
- (void)longPressToDeleteItem:(NSArray*)newtitles;
- (void)addNewChannelAction;

@end

@interface XWSlideSegmentView : UIView

@property(nonatomic, copy)NSArray * titles;
@property(nonatomic, assign)NSUInteger selectedIndex;
@property ( nonatomic, assign) BOOL isSeparated;
@property(nonatomic, copy) XWSelectHandle  selectedIndexHandle;
@property ( nonatomic, strong) id<XWSegSelectDelegate>touchDelegate;


@property ( nonatomic, strong) UIColor *titleColor;
@property ( nonatomic, assign) CGFloat titleFontSize;
@property ( nonatomic, strong) UIColor *selectedColor;

-(id)initWithFrame:(CGRect)frame Titles:(NSArray*)titles;
-(void)addnewItemTitle:(NSString*)title;
-(void)addNewItemsTitles:(NSArray*)titles;
-(NSArray*)deleteSelectedItem;

@end
