//
//  MJCshishiLaout.m
//  MJC项目大杂烩
//
//  Created by mjc on 16/12/2.
//
//

#import "MJCPlainFlowLayout.h"


@interface MJCPlainFlowLayout()<UICollectionViewDelegateFlowLayout>

/** w */
@property (nonatomic,assign) CGFloat itemW;
@property (nonatomic,assign) CGFloat itemH;
@property (nonatomic,assign) CGFloat itemX;
@property (nonatomic,assign) CGFloat itemY;

/** 每行数量 */
@property (nonatomic,assign) NSInteger count;

@property (nonatomic,assign) CGFloat leftSpacing;//最左边间距
@property (nonatomic,assign) CGFloat topSpacing;//最顶部间距
@property (nonatomic,assign) CGFloat bottomSpacing;//最底部间距
@property (nonatomic,assign) CGFloat rightSpacing;//最右边间距
@property (nonatomic,assign) CGFloat lineSpacing;//两个item之间,中间的列间距
@property (nonatomic,assign) CGFloat rowSpacing;//两个item之间,中间的行间距

/** collection宽度 */
@property (nonatomic,assign) CGFloat collectionViewW;

@end


@implementation MJCPlainFlowLayout



- (instancetype)init
{
    if (self = [super init]) {
        
        
        
    }
    return self;
}

/**
 * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
 * 一旦重新刷新布局，就会重新调用下面的方法：
 1.prepareLayout
 2.layoutAttributesForElementsInRect:方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 * 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作）
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    
    //获取collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    _collectionViewW = collectionViewW;
    self.minimumInteritemSpacing = 0;//最小间距值
    
    if (_rollingDirection == UICollectionViewScrollDirectionVertical) {
        //默认垂直滚动
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }else{
        self.scrollDirection = _rollingDirection;
    }
    
    //设置上下两个item中间的行间距
    self.minimumLineSpacing = _rowSpacing;
    //设置顶间距,左间距,底部间距,右间距
    self.sectionInset = UIEdgeInsetsMake(_topSpacing,_leftSpacing,_bottomSpacing,_rightSpacing);
    //计算item布局属性的宽度 (列间距)
    _itemW = (collectionViewW - _leftSpacing - _rightSpacing - (_count - 1) * _lineSpacing) / _count;
    
    
    //计算item布局属性的宽度
    [self relieveitemHegight:_relieveitemHegight itemHegight:_itemHegight];

    
    //设置item大小
    self.itemSize = CGSizeMake(_itemW,_itemH);
    
    
}

-(void)setItemHegight:(CGFloat)itemHegight
{
    _itemHegight = itemHegight;

    _itemH = itemHegight;
    
}

-(void)setItemCount:(NSInteger)itemCount
{
    _itemCount = itemCount;
    _count = itemCount;
}

-(void)setItemLeftMargin:(CGFloat)itemLeftMargin
{
    _itemLeftMargin = itemLeftMargin;
    
    _leftSpacing = itemLeftMargin;
    
}

-(void)setItemRightMargin:(CGFloat)itemRightMargin
{
    _itemRightMargin = itemRightMargin;
    
    _rightSpacing = itemRightMargin;
    
}

-(void)setItemTopMargin:(CGFloat)itemTopMargin
{
    _itemTopMargin = itemTopMargin;
    
    _topSpacing = itemTopMargin;
}

-(void)setItemBottomMargin:(CGFloat)itemBottomMargin
{
    _itemBottomMargin = itemBottomMargin;
    
    _bottomSpacing = itemBottomMargin;
}

-(void)setItemLineMargin:(CGFloat)itemLineMargin
{
    _itemLineMargin = itemLineMargin;
    
    _lineSpacing = itemLineMargin;
}


-(void)setItemRowMargin:(CGFloat)itemRowMargin
{
    _itemRowMargin = itemRowMargin;
    
    _rowSpacing = itemRowMargin;
}


#pragma mark --释放方法
-(void)relieveCountlimit:(BOOL)relieveCountlimit itemCount:(NSInteger)itemCount
{
    _itemCount = itemCount;
    
    if (relieveCountlimit == YES) {
        _count = itemCount;
        return;
    }
}

-(void)relieveLeftMargin:(BOOL)relieveLeftMargin itemLeftMargin:(CGFloat)itemLeftMargin
{
    _itemLeftMargin = itemLeftMargin;
    
    if (relieveLeftMargin == YES) {
        _leftSpacing = _itemLeftMargin;
        return;
    }
}

-(void)relieveRightMargin:(BOOL)relieveRightMargin itemRightMargin:(CGFloat)itemRightMargin
{
    _itemRightMargin = itemRightMargin;
    
    if (relieveRightMargin == YES) {
        _rightSpacing = _itemRightMargin;
        return;
    }
    
}

-(void)relieveTopMargin:(BOOL)relieveTopMargin itemLineMargin:(CGFloat)itemTopMargin
{
    _itemTopMargin = itemTopMargin;
    
    if (relieveTopMargin == YES) {
        _topSpacing = _itemTopMargin;
        return;
    }
    
}

-(void)relieveBottomMargin:(BOOL)relieveBottomMargin itemBottomMargin:(CGFloat)itemBottomMargin
{
    _itemBottomMargin = itemBottomMargin;
    
    if (relieveBottomMargin == YES) {
        _bottomSpacing = _itemBottomMargin;
        return;
    }
}

-(void)relieveRowMargin:(BOOL)relieveRowMargin itemRowMargin:(CGFloat)itemRowMargin
{
    _itemRowMargin = itemRowMargin;
    
    if (relieveRowMargin == YES) {
        _rowSpacing = _itemRowMargin;
        return;
    }
    
}


-(void)relieveLineMargin:(BOOL)relieveLineMargin itemLineMargin:(CGFloat)itemLineMargin
{
    _itemLineMargin = itemLineMargin;
    
    if (relieveLineMargin == YES) {
        _lineSpacing = _itemLineMargin;
        return;
    }
}

-(void)relieveitemHegight:(BOOL)relieveitemHegight itemHegight:(CGFloat)itemHegight
{
    _itemHegight = itemHegight;
    _relieveitemHegight = relieveitemHegight;
    
    if (relieveitemHegight == YES) {
        _itemH = itemHegight;
    }else{
        //计算item布局属性的宽度
        _itemH = (_collectionViewW - _topSpacing - _bottomSpacing - (_count - 1) * _rowSpacing) / _count;
    }
}






@end
