### XWSlideSegmentView 
#### is a slide segment selection controller, sliding view, dynamic increase options, support agents and block callback, support XIB, easy to use.

#### XWSlideSegmentView是一款轻量的分段选择控制器，可滑动查看、可动态增加选项，支持代理和block回调，支持XIB，简单易用.

#### ---支持代码和XIB 初始化方法--
#### ---@property (weak, nonatomic) IBOutlet XWSegCtr *segCtr;
 #### ---(id)initWithFrame:(CGRect)frame Titles:(NSArray*)titles--

#### ---支持代理--
#### ---@protocol TouchLabelDelegate <NSObject>--
#### ---@property ( nonatomic, strong) id<TouchLabelDelegate>touchDelegate;--
#### ---(void)SelectedItemWithIndex:(NSInteger)index--

#### ---支持动态添加元素--
#### ---[_segCtr addnewItemTitle:@"新来的"];--

