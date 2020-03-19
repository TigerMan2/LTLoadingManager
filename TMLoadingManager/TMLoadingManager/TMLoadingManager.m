//
//  TMLoadingManager.m
//  TMLoadingManager
//
//  Created by Luther on 2019/4/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "TMLoadingManager.h"

#define keyWindow [UIApplication sharedApplication].keyWindow

/** 加载的提示语 */
static NSString         *TMLoadingMessage = @"loading...";

/** 加载成功的提示语 */
static NSString         *TMSuccessMessage = @"加载成功";
/** 加载成功的图片 */
static NSString         *TMSuccessImageName = @"loading...";

/** 加载失败的提示语 */
static NSString         *TMFailMessage = @"加载失败";
/** 加载失败时的图片 */
static NSString         *TMFailImageName = @"loading...";

/** 默认简短语的显示时间 */
static NSTimeInterval   TMShowTime = 1.5f;

@implementation TMLoadingManager

#pragma mark - 显示加载

+ (void)showLoading {
    [self showLoadingHudWithMessage:nil];
}

+ (void)showLoadingHudWithInView:(UIView *)view {
    [self showLoadingHudWithInView:view isShowMaskView:NO];
}

+ (void)showLoadingHudWithMessage:(NSString *)message {
    [self showLoadingHudWithMessage:message isShowMaskView:NO];
}

+ (void)showLoadingHudWithInView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView {
    [self showLoadingHudWithMessage:TMLoadingMessage inView:view isShowMaskView:isShowMaskView];
}

+ (void)showLoadingHudWithMessage:(NSString *)message isShowMaskView:(BOOL)isShowMaskView {
    [self showLoadingHudWithMessage:message inView:nil isShowMaskView:isShowMaskView];
}

+ (void)showLoadingHudWithMessage:(NSString *)message inView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView {
    [self showLoadingHudWithMessage:message inView:view isShowMaskView:isShowMaskView completionBlock:nil];
}

+ (void)showLoadingHudWithMessage:(NSString *)message inView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    if (view == nil) view = keyWindow;
    //先隐藏可能存在的hud
    [MBProgressHUD hideHUDForView:view animated:YES];
    //添加新的hud
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    if (isShowMaskView) {
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [UIColor colorWithWhite:0.3f alpha:0.5f];
    }
    hud.label.text = message ? message : TMLoadingMessage;
    hud.completionBlock = completionBlock;
}

#pragma mark - 显示状态

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state {
    [self showStateHudWithMessage:message state:state imageName:nil];
}

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName {
    [self showStateHudWithMessage:message state:state imageName:imageName isShowMaskView:NO];
}

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView {
    [self showStateHudWithMessage:message state:state imageName:imageName isShowMaskView:isShowMaskView afterDelay:0];
}

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay {
    [self showStateHudWithMessage:message state:state imageName:imageName isShowMaskView:isShowMaskView afterDelay:delay inView:nil];
}

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view {
    [self showStateHudWithMessage:message state:state imageName:imageName isShowMaskView:isShowMaskView afterDelay:delay inView:view completionBlock:nil];
}

+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    NSString *titleMessage = nil;
    NSString *imageString = nil;
    switch (state) {
        case TMHUDShowTypeSuccess:
        {
            titleMessage = message ? message : TMSuccessMessage;
            imageString  = imageName ? imageName : TMSuccessImageName;
        }
            break;
        case TMHUDShowTypeFail:
        {
            titleMessage = message ? message : TMFailMessage;
            imageString  = imageName ? imageName : TMFailImageName;
        }
            break;
            
        default:
            break;
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageString]];
    [self showHudWithMessage:message customImageView:imageView mode:MBProgressHUDModeCustomView isShowMaskView:isShowMaskView afterdelay:delay inView:view completionBlock:completionBlock];
}

#pragma mark - 显示文字

+ (void)showMessage:(NSString *)message {
    [self showMessage:message afterDelay:TMShowTime];
}

+ (void)showMessage:(NSString *)message inView:(UIView *)view {
    [self showMessage:message afterDelay:TMShowTime inView:view];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [self showMessage:message afterDelay:delay inView:nil];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay inView:(UIView *)view {
    [self showMessage:message afterDelay:delay inView:view completionBlock:nil];
}

+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    [self showHudWithMessage:message customImageView:nil mode:MBProgressHUDModeText isShowMaskView:NO afterdelay:delay inView:view completionBlock:completionBlock];
}

#pragma mark - 显示自定义视图

+ (void)showHudWithCustomView:(UIView *)customView {
    [self showHudWithCustomView:customView inView:nil];
}

+ (void)showHudWithCustomView:(UIView *)customView inView:(UIView *)view {
    [self showHudWithCustomView:customView isShowMaskView:NO inView:view];
}

+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView inView:(UIView *)view {
    [self showHudWithCustomView:customView isShowMaskView:isShowMaskView afterDelay:TMShowTime inView:view];
}

+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay {
    [self showHudWithCustomView:customView isShowMaskView:isShowMaskView afterDelay:delay inView:nil];
}

+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view {
    [self showHudWithMessage:nil customView:customView isShowMaskView:isShowMaskView afterDelay:delay inView:view];
}

+ (void)showHudWithMessage:(NSString *)message customView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view {
    [self showHudWithMessage:message customImageView:customView mode:MBProgressHUDModeCustomView isShowMaskView:isShowMaskView afterdelay:delay inView:view completionBlock:nil];
}

+ (void)showHudWithMessage:(NSString *)message customImageView:(UIView *)customImageView mode:(MBProgressHUDMode)mode isShowMaskView:(BOOL)isShowMaskView afterdelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock {
    
    if (view == nil) view = keyWindow;
    //移除可能存在的HUD
    [MBProgressHUD hideHUDForView:view animated:YES];
    //添加新的HUD
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    if (mode == MBProgressHUDModeCustomView) {
        hud.customView = customImageView;
    }
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    hud.label.text = message;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    
    if (isShowMaskView) {
        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.backgroundView.color = [UIColor colorWithWhite:0.3f alpha:0.5f];
    }
    
    //隐藏hud
    NSTimeInterval showTime = delay>0 ? delay : TMShowTime;
    [hud hideAnimated:YES afterDelay:showTime];
}

#pragma mark - 隐藏
+ (void)hidenHudFromView:(UIView *)view {
    if (view == nil) view = keyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)hidenHud {
    [self hidenHudFromView:nil];
}

@end
