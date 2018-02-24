//
//  Header.h
//  XWSlideSelectView
//
//  Created by vivi wu on 2018/2/24.
//  Copyright © 2018年 viviwu. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define kSelfBounds self.view.bounds
#define kSelfVB_H self.view.bounds.size.height
#define kSelfVB_W self.view.bounds.size.width

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define kScreenW UIScreen.mainScreen.bounds.size.width
#define kCellW (kScreenW-80.0)/2.0
#define kCellH kCellW+20.0

#endif /* Header_h */
