//
//  MJCshishiLaout.h
//  MJC项目大杂烩
//
//  Created by mjc on 16/12/2.
//
//

#import <UIKit/UIKit.h>

@interface MJCPlainFlowLayout : UICollectionViewFlowLayout


/** 默认的列数 */
@property (nonatomic,assign) NSInteger itemCount;
/** 释放数量限制 */
-(void)relieveCountlimit:(BOOL)relieveCountlimit itemCount:(NSInteger)itemCount;

/** 每一列中间的间距 */
@property (nonatomic,assign) CGFloat itemLineMargin;
/** 释放每一列中间的间距的方法 */
-(void)relieveLineMargin:(BOOL)relieveLineMargin itemLineMargin:(CGFloat)itemLineMargin;


/** 每一行中间的间距 */
@property (nonatomic,assign) CGFloat itemRowMargin;
/** 释放每一列中间的间距的方法 */
-(void)relieveRowMargin:(BOOL)relieveRowMargin itemRowMargin:(CGFloat)itemRowMargin;


/** 最左边的间距 */
@property (nonatomic,assign) CGFloat itemLeftMargin;
/** 释放最左边的间距的方法 */
-(void)relieveLeftMargin:(BOOL)relieveLeftMargin itemLeftMargin:(CGFloat)itemLeftMargin;



/** 最右边的间距 */
@property (nonatomic,assign) CGFloat itemRightMargin;
/** 释放最右边的间距的方法 */
-(void)relieveRightMargin:(BOOL)relieveRightMargin itemRightMargin:(CGFloat)itemRightMargin;



/** 最顶部的间距 */
@property (nonatomic,assign) CGFloat itemTopMargin;
/** 释放最顶部间距的方法 */
-(void)relieveTopMargin:(BOOL)relieveTopMargin itemLineMargin:(CGFloat)itemTopMargin;




/** 最底部的间距 */
@property (nonatomic,assign) CGFloat itemBottomMargin;
/** 释放最底部的间距的方法 */
-(void)relieveBottomMargin:(BOOL)relieveBottomMargin itemBottomMargin:(CGFloat)itemBottomMargin;


/** item的高度 */
@property (nonatomic,assign) CGFloat itemHegight;
/** 释放每个item的高度的方法 */
-(void)relieveitemHegight:(BOOL)relieveitemHegight itemHegight:(CGFloat)itemHegight;
/** 是否释放item高度 */
@property (nonatomic,getter=relieveitemHegight) BOOL relieveitemHegight;


//
///** item的宽度 */
//@property (nonatomic,assign) CGFloat itemWidth;
///** 每一列中间的间距 */
//-(void)relieveitemWidth:(BOOL)relieveitemWidth itemWidth:(CGFloat)itemWidth;
///**  */
//@property (nonatomic,getter=relieveitemWidth) BOOL relieveitemWidth;



/** 滚动方向 */
@property (nonatomic) UICollectionViewScrollDirection rollingDirection;



@end
