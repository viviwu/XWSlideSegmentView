//
//  XWSegCtr.h
//  QQ:286218985
//
//  Created by viviwu on 16/4/18.
//  Copyright © 2016年 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XWSelectedIndexHandle)(NSInteger selectedIndex);

@protocol TouchLabelDelegate <NSObject>

- (void)SelectedItemWithIndex:(NSInteger)index;

@end

@interface XWSegCtr : UIView

@property(nonatomic, copy)NSArray * titles;
@property(nonatomic, assign)NSUInteger selectedIndex;
@property ( nonatomic, assign) BOOL isSeparated;
@property(nonatomic, copy) XWSelectedIndexHandle  selectedIndexHandle;
@property ( nonatomic, strong) id<TouchLabelDelegate>touchDelegate;


@property ( nonatomic, strong) UIColor *titleColor;
@property ( nonatomic, assign) CGFloat titleFontSize;
@property ( nonatomic, strong) UIColor *selectedColor;

-(id)initWithFrame:(CGRect)frame Titles:(NSArray*)titles;
-(void)addnewItemTitle:(NSString*)title;
-(void)addNewItemsTitles:(NSArray*)titles;

@end
