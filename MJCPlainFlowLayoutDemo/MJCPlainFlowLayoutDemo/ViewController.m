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
    
    MJCPlainFlowLayout *layout = [[MJCPlainFlowLayout alloc]init];
    layout.srollingDirection = UICollectionViewScrollDirectionVertical;
    layout.vlitemLineMaxCount = 2;
    layout.vlitemMaxLeftMargin = 10;
    layout.vlitemMaxRightMargin = 10;
    layout.vlitemLineMargin = 40;
    layout.vlitemRowMargin = 60;
    layout.vlitemHegight = 50;
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,40);
    [self.collectionView1 setCollectionViewLayout:layout];
    self.collectionView1.delegate = self;
    self.collectionView1.dataSource = self;
    [self.collectionView1 registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    [self.collectionView1 registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJCCellID];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_inter == 0){
        _inter ++ ;
        MJCPlainFlowLayout  *layout= [[MJCPlainFlowLayout alloc]init];
        layout.srollingDirection = UICollectionViewScrollDirectionHorizontal;
        layout.hlitemShowMaxCount = 4;
        layout.hlitemMaxRightMargin = 10;
        layout.hlitemMaxLeftMargin = 10;
        layout.hlitemMaxTopMargin = self.collectionView1.frame.size.height  / 2 - 80;
        layout.hlitemMaxBottomMargin = self.collectionView1.frame.size.height / 2 - 80;
        layout.hlitemLineMargin = 10;
        layout.headerReferenceSize = CGSizeMake(40,self.collectionView1.frame.size.height);
        [self.collectionView1 setCollectionViewLayout:layout animated:YES];
    
    }else if (_inter == 1){
        _inter ++ ;
        MJCPlainFlowLayout  *layout= [[MJCPlainFlowLayout alloc]init];
        layout.vlitemLineMaxCount = 3;
        layout.vlitemMaxLeftMargin = 10;
        layout.vlitemMaxRightMargin = 20;
        layout.vlitemMaxTopMargin = 30;
        layout.vlitemMaxBottomMargin = 40;
        layout.vlitemLineMargin = 40;
        layout.vlitemRowMargin = 60;
        layout.vlitemHegight = 50;
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,40);
        [self.collectionView1 setCollectionViewLayout:layout animated:YES];
    }else{
        _inter = 0;
        MJCPlainFlowLayout *layout = [[MJCPlainFlowLayout alloc]init];
        layout.vlitemLineMaxCount = 2;
        layout.vlitemMaxLeftMargin = 10;
        layout.vlitemMaxRightMargin = 10;
        layout.vlitemMaxTopMargin = 10;
        layout.vlitemMaxBottomMargin = 20;
        layout.vlitemLineMargin = 10;
        layout.vlitemRowMargin = 10;
        layout.vlitemHegight = 50;
        [self.collectionView1 setCollectionViewLayout:layout animated:YES];
    }

}
#pragma mark --<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    self.headerView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView"   forIndexPath:indexPath];
    self.headerView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return self.headerView;
}



@end
