//
//  AppDelegate+CaughtException.h
//  Exceptionemo
//
//  Created by A11130321050034 on 17/4/16.
//  Copyright © 2017年 GMY. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CaughtException)

/**
 * 捕获异常，在didFinishLaunchingWithOptions方法中调用
 */
- (void)caughtExceptionHandler;

/**
 * 保存错误信息到沙盒
 */
- (void)saveException:(NSMutableDictionary*)dic;

/**
 * 从沙盒读取错误信息
 */
- (NSDictionary *)readException;

/**
 * 删除沙盒错误信息
 */
- (void)deleteException;
@end
