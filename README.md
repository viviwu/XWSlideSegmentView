### XWSlideSegmentView 
##### is a slide segment selection controller, sliding view, dynamic increase options, support agents android block callback, support XIB, easy to use.

##### XWSlideSegmentView是一款轻量的分段选择控制器，可滑动查看、可动态增加选项，支持代理和block回调，支持XIB，简单易用.

#### ---支持代码和XIB 初始化方法--
######  @property (weak, nonatomic) IBOutlet XWSlideSegmentView * segCtr;

######  -(id)initWithFrame:(CGRect)frame Titles:(NSArray*)titles 

#### ---支持代理--
######  @protocol TouchLabelDelegate <NSObject>
######  @property ( nonatomic, strong) id<TouchLabelDelegate>touchDelegate;
###### -(void)SelectedItemWithIndex:(NSInteger)index

#### ---支持动态添加元素--
######  [_segCtr addnewItemTitle:@"新来的"];

![效果图](https://github.com/viviwu/XWSlideSegmentView/blob/master/XWSlideSegmentView/屏幕快照%202018-02-23%2017.38.24.png)

****

