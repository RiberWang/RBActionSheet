//
//  RBActionSheetView.h
//  MANAApp
//
//  Created by Riber on 2016/12/8.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RBImageName @"imageName"
#define RBTitle @"title"

typedef void(^SheetButtonClickBlock)();

@interface RBActionSheetView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) SheetButtonClickBlock sheetButtonClickBlock;

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)dataArray;

@end
