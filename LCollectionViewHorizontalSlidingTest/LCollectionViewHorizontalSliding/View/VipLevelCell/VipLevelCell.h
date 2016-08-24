//
//  VipLevelCell.h
//  BeeEnrichmentAppiOS
//
//  Created by LiuXiaoMin on 16/7/25.
//  Copyright © 2016年 LiuXiaoMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VipLevelCell : UICollectionViewCell
- (void)setVipLevelWithNum:(NSInteger)num alreadyArriveNum:(NSInteger)alreadyArriveNum progress:(CGFloat)progress selectedNum:(NSInteger)selectedNum isLast:(BOOL)isLast;
@end
