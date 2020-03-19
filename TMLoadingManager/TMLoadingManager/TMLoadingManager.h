//
//  TMLoadingManager.h
//  TMLoadingManager
//
//  Created by Luther on 2019/4/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, TMHUDShowType) {
    TMHUDShowTypeSuccess    = 0,    //成功
    TMHUDShowTypeFail               //失败
};

@interface TMLoadingManager : NSObject

#pragma mark - 显示加载
+ (void)showLoading;
+ (void)showLoadingHudWithMessage:(NSString *)message;
+ (void)showLoadingHudWithInView:(UIView *)view;
+ (void)showLoadingHudWithInView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView;
+ (void)showLoadingHudWithMessage:(NSString *)message isShowMaskView:(BOOL)isShowMaskView;
+ (void)showLoadingHudWithMessage:(NSString *)message inView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView;
+ (void)showLoadingHudWithMessage:(NSString *)message inView:(UIView *)view isShowMaskView:(BOOL)isShowMaskView completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 显示状态
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state;
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName;
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView;
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay;
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view;
+ (void)showStateHudWithMessage:(NSString *)message state:(TMHUDShowType)state imageName:(NSString *)imageName isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 显示文字
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message inView:(UIView *)view;
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay inView:(UIView *)view;
+ (void)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 显示自定义视图
+ (void)showHudWithCustomView:(UIView *)customView;
+ (void)showHudWithCustomView:(UIView *)customView inView:(UIView *)view;
+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView inView:(UIView *)view;
+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay;
+ (void)showHudWithCustomView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view;
+ (void)showHudWithMessage:(NSString *)message customView:(UIView *)customView isShowMaskView:(BOOL)isShowMaskView afterDelay:(NSTimeInterval)delay inView:(UIView *)view;
+ (void)showHudWithMessage:(NSString *)message customImageView:(UIView *)customImageView mode:(MBProgressHUDMode)mode isShowMaskView:(BOOL)isShowMaskView afterdelay:(NSTimeInterval)delay inView:(UIView *)view completionBlock:(MBProgressHUDCompletionBlock)completionBlock;

#pragma mark - 隐藏
+ (void)hidenHudFromView:(UIView *)view;
+ (void)hidenHud;

@end
