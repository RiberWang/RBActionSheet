//
//  RBActionSheetView.m
//  MANAApp
//
//  Created by Riber on 2016/12/8.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import "RBActionSheetView.h"
#import "UIView+Extension.h"

#define IsNilOrLengthEqutoZreoOf(string) (string.length == 0 || [string isEqualToString:@""] || string == nil || [string isKindOfClass:[NSNull class]])
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/**
 *  3.返回一个RGB格式的UIColor对象
 */
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

@implementation RBActionSheetView

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)dataArray
{
    if (self = [super initWithFrame:frame]) {
        _dataArray = dataArray;
        
//        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    if (self.dataArray.count > 0) {
        if (self.dataArray.count == 1) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor whiteColor];
            button.frame = CGRectMake(0, 0, self.frame.size.width, 44);
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 5;
            
            if (!IsNilOrLengthEqutoZreoOf(RBImageName)) {
                [button setImage:[UIImage imageNamed:_dataArray[0][RBImageName]] forState:UIControlStateNormal];
            }
            if (!IsNilOrLengthEqutoZreoOf(RBTitle)) {
                [button setTitle:_dataArray[0][RBTitle] forState:UIControlStateNormal];
                [button setTitleColor:RGB(53, 54, 54) forState:UIControlStateNormal];
            }
            
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            [button addTarget:self action:@selector(sheetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        else if (self.dataArray.count == 2)
        {
            for (int i = 0; i < self.dataArray.count; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.backgroundColor = [UIColor whiteColor];
                button.frame = CGRectMake(0, i*(44+5), self.frame.size.width, 44);
                button.layer.masksToBounds = YES;
                button.layer.cornerRadius = 5;
                
                if (!IsNilOrLengthEqutoZreoOf(RBImageName)) {
                    [button setImage:[UIImage imageNamed:_dataArray[i][RBImageName]] forState:UIControlStateNormal];
                }
                if (!IsNilOrLengthEqutoZreoOf(RBTitle)) {
                    [button setTitle:_dataArray[i][RBTitle] forState:UIControlStateNormal];
                    [button setTitleColor:RGB(53, 54, 54) forState:UIControlStateNormal];
                }

                button.titleLabel.font = [UIFont systemFontOfSize:16];
                button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
                [button addTarget:self action:@selector(sheetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                
                if (i == 0) {
                    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, button.height-0.5, button.width, 0.5)];
                    lineView.backgroundColor = RGB(201, 201, 201);
                    [button addSubview:lineView];
                }
            }
        }
        else
        {
            for (int i = 0; i < self.dataArray.count; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.backgroundColor = [UIColor whiteColor];
                button.frame = CGRectMake(0, i*(44), self.frame.size.width, 44);
                button.tag = i;

                if (!IsNilOrLengthEqutoZreoOf(RBImageName)) {
                    [button setImage:[UIImage imageNamed:_dataArray[i][RBImageName]] forState:UIControlStateNormal];
                }
                if (!IsNilOrLengthEqutoZreoOf(RBTitle)) {
                    [button setTitle:_dataArray[i][RBTitle] forState:UIControlStateNormal];
                    [button setTitleColor:RGB(53, 54, 54) forState:UIControlStateNormal];
                }
                
                button.titleLabel.font = [UIFont systemFontOfSize:16];
                button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
                [button addTarget:self action:@selector(sheetButtonClick:) forControlEvents:UIControlEventTouchUpInside];

                [self addSubview:button];

                if (i == 0) {
                    
                    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:button.layer.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
                    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
                    shapeLayer.path = bezierPath.CGPath;
                    button.layer.mask = shapeLayer;
                    
                    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, button.height-0.5, button.width, 0.5)];
                    lineView.backgroundColor = RGB(201, 201, 201);
                    [button addSubview:lineView];
                }
                else if (i == self.dataArray.count - 2)
                {
                    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:button.layer.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
                    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
                    shapeLayer.path = bezierPath.CGPath;
                    button.layer.mask = shapeLayer;
                }
                else if (i == self.dataArray.count - 1)
                {
                    button.frame = CGRectMake(0, i*(44)+5, self.frame.size.width, 44);
                    button.layer.masksToBounds = YES;
                    button.layer.cornerRadius = 5;
                }
                else
                {
                    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, button.height-0.5, button.width, 0.5)];
                    lineView.backgroundColor = RGB(201, 201, 201);
                    [button addSubview:lineView];
                }
            }
        }
    }
}

- (void)sheetButtonClick:(UIButton *)button {
    if (self.sheetButtonClickBlock) {
        self.sheetButtonClickBlock(button);
    }
}

@end
