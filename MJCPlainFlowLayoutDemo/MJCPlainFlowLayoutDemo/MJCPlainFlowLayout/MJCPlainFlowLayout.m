//
//  MJCPlainFlowLayout.m
//  MJC
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
    
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    CGFloat collectionViewH = self.collectionView.frame.size.height;
    self.minimumInteritemSpacing = 0;//最小间距值
    if (_srollingDirection == UICollectionViewScrollDirectionVertical) {
        self.scrollDirection = _srollingDirection;//默认垂直滚动
        [self setupScrollDirectionVertical:collectionViewW];
    }else{
        self.scrollDirection = _srollingDirection;
        [self setupScrollDirectionHorizontal:collectionViewW collectionViewH:collectionViewH];
    }
    
}
-(void)setupScrollDirectionHorizontal:(CGFloat)collectionViewW collectionViewH:(CGFloat)collectionViewH
{
    //设置上下两个item中间的行间距
    self.minimumLineSpacing = _lineSpacing;
    
    //    layout.sectionInset = UIEdgeInsetsMake(40,10,20,10);//格子离顶部左边底部右边
    //    layout.minimumLineSpacing = 10;//最小列间距
    //    格子离顶部左边底部右边
    //    layout.sectionInset = UIEdgeInsetsMake(40,10,20,10);
    
    //设置顶间距,左间距,底部间距,右间距
    self.sectionInset = UIEdgeInsetsMake(_topSpacing,_leftSpacing,_bottomSpacing,_rightSpacing);
    
    //计算item宽度 (collectionViewW - 最左边间距 - 最右边间距 - (每列之间的列间距)) / 列数
    _itemW = (collectionViewW - _leftSpacing - _rightSpacing - (_count - 1) * _lineSpacing) / _count;
    //计算item高度
    _itemH = (collectionViewH - _topSpacing - _bottomSpacing);
    //设置item大小
    self.itemSize = CGSizeMake(_itemW,_itemH);
}


// !!!:垂直滚动
-(void)setupScrollDirectionVertical:(CGFloat)collectionViewW
{
    //设置上下两个item中间的行间距
    self.minimumLineSpacing = _rowSpacing;
    
    //设置顶间距,左间距,底部间距,右间距
    self.sectionInset = UIEdgeInsetsMake(_topSpacing,_leftSpacing,_bottomSpacing,_rightSpacing);
    
    //计算item宽度 (collectionViewW - 最左边间距 - 最右边间距 - (每列之间的列间距)) / 列数
    _itemW = (collectionViewW - _leftSpacing - _rightSpacing - (_count - 1) * _lineSpacing) / _count;
    
    //设置item大小
    self.itemSize = CGSizeMake(_itemW,_itemH);
    
}


#pragma mark -- UICollectionViewScrollDirectionHorizontal(平行滚动)

-(void)setHlitemShowMaxCount:(NSInteger)hlitemShowMaxCount
{
    _hlitemShowMaxCount = hlitemShowMaxCount;
    _count = hlitemShowMaxCount;
}
-(void)setHlitemMaxTopMargin:(CGFloat)hlitemMaxTopMargin
{
    _hlitemMaxTopMargin = hlitemMaxTopMargin;
    _topSpacing = hlitemMaxTopMargin;
}
-(void)setHlitemMaxBottomMargin:(CGFloat)hlitemMaxBottomMargin
{
    _hlitemMaxBottomMargin = hlitemMaxBottomMargin;
    _bottomSpacing = hlitemMaxBottomMargin;
}
-(void)setHlitemMaxLeftMargin:(CGFloat)hlitemMaxLeftMargin
{
    _hlitemMaxLeftMargin = hlitemMaxLeftMargin;
    _leftSpacing = hlitemMaxLeftMargin;
}
-(void)setHlitemMaxRightMargin:(CGFloat)hlitemMaxRightMargin
{
    _hlitemMaxRightMargin = hlitemMaxRightMargin;
    _rightSpacing = hlitemMaxRightMargin;
}
-(void)setHlitemLineMargin:(CGFloat)hlitemLineMargin
{
    _hlitemLineMargin = hlitemLineMargin;
    _lineSpacing = hlitemLineMargin;
}

#pragma mark -- UICollectionViewScrollDirectionVertical(垂直滚动)

-(void)setVlitemLineMaxCount:(NSInteger)vlitemLineMaxCount
{
    _vlitemLineMaxCount = vlitemLineMaxCount;
    _count = vlitemLineMaxCount;
}

-(void)setVlitemHegight:(CGFloat)vlitemHegight
{
    _vlitemHegight = vlitemHegight;
    
    _itemH = vlitemHegight;
}

-(void)setVlitemMaxLeftMargin:(CGFloat)vlitemMaxLeftMargin
{
    _vlitemMaxLeftMargin = vlitemMaxLeftMargin;
    _leftSpacing = vlitemMaxLeftMargin;
}

-(void)setVlitemMaxRightMargin:(CGFloat)vlitemMaxRightMargin
{
    _vlitemMaxRightMargin = vlitemMaxRightMargin;
    _rightSpacing = vlitemMaxRightMargin;
}

-(void)setVlitemMaxTopMargin:(CGFloat)vlitemMaxTopMargin
{
    _vlitemMaxTopMargin = vlitemMaxTopMargin;
    
    _topSpacing = vlitemMaxTopMargin;
}
-(void)setVlitemMaxBottomMargin:(CGFloat)vlitemMaxBottomMargin
{
    _vlitemMaxBottomMargin = vlitemMaxBottomMargin;
    
    _bottomSpacing = vlitemMaxBottomMargin;
}

-(void)setVlitemLineMargin:(CGFloat)vlitemLineMargin
{
    _vlitemLineMargin = vlitemLineMargin;
    
    _lineSpacing = vlitemLineMargin;
}

-(void)setVlitemRowMargin:(CGFloat)vlitemRowMargin
{
    _vlitemRowMargin = vlitemRowMargin;
    
    _rowSpacing = vlitemRowMargin;
}



@end
