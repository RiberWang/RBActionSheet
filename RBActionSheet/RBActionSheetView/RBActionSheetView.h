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

/**
 * This class is suit to ActionSheet
 * support add image or title
 */

@interface RBActionSheetView : UIView

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) SheetButtonClickBlock sheetButtonClickBlock; /**< buttonclickblock tag = 0 */

/*!
 * init method \n
 * dataArray is must exist \n
 * dataArray format:
 * @[@{RBImageName:@"takephoto", RBTitle:@"拍摄"}, @{RBImageName:@"photolibrary", RBTitle:@"相册"}, @{RBImageName:@"", RBTitle:@"取消"}];
 */
- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray *)dataArray;

@end
