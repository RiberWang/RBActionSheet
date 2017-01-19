//
//  ViewController.m
//  RBActionSheet
//
//  Created by Riber on 2017/1/19.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "ViewController.h"
#import "RBActionSheetView.h"
#import "UIView+Extension.h"
#import "MBProgressHUD+NJ.h"

#define kSCREENW [UIScreen mainScreen].bounds.size.width
#define kSCREENH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIView *sheetBgView;
@property (nonatomic, strong) RBActionSheetView *actionSheetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}


- (void)createUI {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgIV.image = [UIImage imageNamed:@"BGImage"];
    [self.view addSubview:bgIV];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor darkGrayColor];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.frame.size.width/2-80, 100, 160, 44);
    button.layer.cornerRadius = 22;
    [button addTarget:self action:@selector(sheetBgViewShow:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _sheetBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kSCREENH, kSCREENW, kSCREENH)];
    [self.view addSubview:_sheetBgView];
    
    _sheetBgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sheetBgViewHide)];
    [_sheetBgView addGestureRecognizer:tap];
    
    NSArray *sheetArray = @[@{RBImageName:@"takephoto", RBTitle:@"拍摄"}, @{RBImageName:@"photolibrary", RBTitle:@"相册"}, @{RBImageName:@"", RBTitle:@"取消"}];
    _actionSheetView = [[RBActionSheetView alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - (sheetArray.count*44+5+sheetArray.count-1)-10, self.view.bounds.size.width-2*10, sheetArray.count*44+5+sheetArray.count-1) andDataArray:sheetArray];
    
    __weak typeof(RBActionSheetView *) weakActionSheetView = _actionSheetView;
    weakActionSheetView.sheetButtonClickBlock = ^(UIButton *sheetButton) {
        
        [self sheetBgViewHide];
        
        if (sheetButton.tag == 0) {
            [MBProgressHUD showSuccess:@"拍照"];
            
        }
        else if (sheetButton.tag == 1)
        {
            [MBProgressHUD showSuccess:@"相册"];
            
        }
        else
        {
            [MBProgressHUD showSuccess:@"取消操作"];
        }
    };
    [_sheetBgView addSubview:_actionSheetView];
    
}

- (void)sheetBgViewShow:(UIButton *)button {
    [UIView animateWithDuration:0.5 animations:^{
        _sheetBgView.y = 0;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)sheetBgViewHide {
    if (_sheetBgView.y != kSCREENH) {
        [UIView animateWithDuration:0.5 animations:^{
            _sheetBgView.y = kSCREENH;
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
