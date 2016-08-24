//
//  LevelSlider.m
//  BeeEnrichmentAppiOS
//
//  Created by LiuXiaoMin on 16/6/29.
//  Copyright © 2016年 LiuXiaoMin. All rights reserved.
//

#import "LevelSlider.h"

@implementation LevelSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, self.bounds.size.width, 1);
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setMinimumTrackImage:[self image_with_color:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[self image_with_color:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]] forState:UIControlStateNormal];
}
//将颜色转换为图片
- (UIImage *)image_with_color:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
