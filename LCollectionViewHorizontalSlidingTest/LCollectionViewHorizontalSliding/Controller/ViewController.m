//
//  ViewController.m
//  LCollectionViewHorizontalSliding
//
//  Created by shijian01 on 16/8/24.
//  Copyright © 2016年 liuxiaomin. All rights reserved.
//

#import "ViewController.h"
#import "VipLevelCell.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) NSInteger numCount, alreadyNum, selectedNum;
@property (weak, nonatomic) IBOutlet UILabel *vLevel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat progress;
@end
#define itemWidth 90
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _vLevel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:14];
    [_collectionView registerNib:[UINib nibWithNibName:@"VipLevelCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"VipLevelCell"];
    //初始化共有多少个会员等级，已达到会员等级，据下一等级已走百分比
    [self setNumCount:10 alreadyNum:4 progress:0.7];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
//初始值
- (void)setNumCount:(NSInteger)numCount alreadyNum:(NSInteger)alreadyNum progress:(CGFloat)progress {
    _vLevel.text = [NSString stringWithFormat:@"当前等级:V%ld",(long)alreadyNum];
    _numCount = numCount;
    _alreadyNum = alreadyNum;
    _selectedNum = _alreadyNum;
    _progress = progress;
    [_collectionView reloadData];
    [self performSelector:@selector(initCollectionViewLocation) withObject:nil afterDelay:0.1];
    
}
- (void)initCollectionViewLocation
{
    [self setCollectionViewContentOffSetWithIndexPath:[NSIndexPath indexPathForItem:_alreadyNum inSection:0]];
}
//collectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _numCount;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(itemWidth, _collectionView.frame.size.height);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VipLevelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VipLevelCell" forIndexPath:indexPath];
    [cell setVipLevelWithNum:indexPath.row alreadyArriveNum:_alreadyNum progress:_progress selectedNum:_selectedNum isLast:(indexPath.row == _numCount - 1) ? YES : NO];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VipLevelCell *cell = (VipLevelCell*)[collectionView cellForItemAtIndexPath:indexPath];
    _selectedNum = indexPath.row;
    [cell setVipLevelWithNum:indexPath.row alreadyArriveNum:_alreadyNum progress:_progress selectedNum:_selectedNum isLast:(indexPath.row == _numCount - 1) ? YES : NO];
    [self setCollectionViewContentOffSetWithIndexPath:indexPath];
    [_collectionView reloadData];
    NSLog(@"当前等级%ld",indexPath.row);
}
- (void)setCollectionViewContentOffSetWithIndexPath:(NSIndexPath*)indexPath
{
    CGFloat f = itemWidth*indexPath.row-(self.view.bounds.size.width/2-30);
    [_collectionView setContentOffset:CGPointMake(f, 0) animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
