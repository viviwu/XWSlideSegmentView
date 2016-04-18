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
@property(nonatomic, copy)XWSelectedIndexHandle  selectedIndexHandle;
@property ( nonatomic, assign) BOOL haveRightLine;

@property ( nonatomic, strong) UIColor *titleColor;
@property ( nonatomic, assign) CGFloat titleFontSize;
@property ( nonatomic, strong) UIColor *titleSelectedColor;

@property ( nonatomic, strong) UIColor *scrollLineColor;

@property ( nonatomic, strong) id<TouchLabelDelegate>touchDelegate;

-(id)initWithFrame:(CGRect)frame Titles:(NSArray*)titles;
-(void)addnewItemTitle:(NSString*)title;

@end
