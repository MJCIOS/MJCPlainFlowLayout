# MJCPlainFlowLayout
###流水布局

![image](https://github.com/MJCIOS/MJCPlainFlowLayout/raw/master/MJCPlainFlowLayoutDemo/MJCPlainFlowLayoutDemo/layout3.gif)
![image](https://github.com/MJCIOS/MJCPlainFlowLayout/raw/master/MJCPlainFlowLayoutDemo/MJCPlainFlowLayoutDemo/layout2.gif)

####用法代码
    
    MJCPlainFlowLayout *layout = [[MJCPlainFlowLayout alloc]init];
    layout.itemCount = 2;//每行的数量
    layout.itemLeftMargin = 10;//最左边间距
    layout.itemRightMargin = 10;//最右边间距
    layout.itemTopMargin = 10;//最顶部间距
    layout.itemBottomMargin = 20;//最底部间距
    layout.itemLineMargin = 40;//列间距
    layout.itemRowMargin = 10;//行间距
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width,50);
    [self.collectionView1 setCollectionViewLayout:layout];
