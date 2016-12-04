//
//  ViewController.m
//  MJCPlainFlowLayoutDemo
//
//  Created by mjc on 16/12/3.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "ViewController.h"
#import "MJCPlainFlowLayout.h"



//定义一个重用标示符
static NSString *const MJCCellID = @"cell";


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView1;

@property (strong, nonatomic) UICollectionReusableView *headerView;

/** <#  注释  #> */
@property (nonatomic,strong) MJCPlainFlowLayout *layout;

/** <#  注释  #> */
@property (nonatomic,assign) NSInteger inter;;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _inter = 0;
    
    MJCPlainFlowLayout *layout = [[MJCPlainFlowLayout alloc]init];
    
    
    layout.itemCount = 2;
    layout.itemLeftMargin = 10;
    layout.itemRightMargin = 10;
    layout.itemLineMargin = 40;
    layout.itemRowMargin = 10;
    
    //设置heardView的大小宽度
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,50);

    [self.collectionView1 setCollectionViewLayout:layout];
    
    self.collectionView1.delegate = self;
    self.collectionView1.dataSource = self;
    
    [self.collectionView1 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    [self.collectionView1 registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJCCellID];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_inter == 0)
    {
        _inter += 1 ;
        
        MJCPlainFlowLayout  *layout= [[MJCPlainFlowLayout alloc]init];
        layout.itemCount = 3;
        
        layout.itemLeftMargin = 10;
        layout.itemRightMargin = 20;
        layout.itemTopMargin = 30;
        layout.itemBottomMargin = 40;
        layout.itemLineMargin = 40;
        layout.itemRowMargin = 60;
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,50);

        
        [self.collectionView1 setCollectionViewLayout:layout animated:YES];
    
    }else{
        _inter = 0;
        
        MJCPlainFlowLayout *layout = [[MJCPlainFlowLayout alloc]init];
        layout.itemCount = 2;
        layout.itemLeftMargin = 10;
        layout.itemRightMargin = 10;
        layout.itemTopMargin = 10;
        layout.itemBottomMargin = 20;
        layout.itemLineMargin = 10;
        layout.itemRowMargin = 10;
        
        
        [self.collectionView1 setCollectionViewLayout:layout animated:YES];
    }

}




#pragma mark - 数据源方法
//多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

// 每组多少个item (里面总共有多少个框框 、件)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 8;
    }else if (section == 3){
        return 7;
    }else{
        return 20;
    }
}

// 每个item（框框 、件）的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    
    return cell;
}
#pragma mark - 代理方法
//选中某个cell框框 触发事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"摸我了");
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString * reuseIdentifier = @"headerView";
    
    self.headerView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    self.headerView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return self.headerView;
}



@end
