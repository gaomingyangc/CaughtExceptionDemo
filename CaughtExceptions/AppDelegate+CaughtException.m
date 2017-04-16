//
//  AppDelegate+CaughtException.m
//  Exceptionemo
//
//  Created by A11130321050034 on 17/4/16.
//  Copyright © 2017年 GMY. All rights reserved.
//

#import "AppDelegate+CaughtException.h"
#import "NSDate+CurrentDate.h"
#import "NSString+DeviceName.h"

#define path NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

#define filePath [path stringByAppendingPathComponent:@"exception"]

@implementation AppDelegate (CaughtException)

- (void)caughtExceptionHandler {

    NSSetUncaughtExceptionHandler(exceptionHandler);
}

void exceptionHandler(NSException *exception){
    
    // 错误信息字典
    NSMutableDictionary *exceptionDic = [NSMutableDictionary dictionary];
    
    UIDevice *device = [[UIDevice alloc] init];
    
    //  当前系统的版本
    [exceptionDic setValue:device.systemVersion forKey:@"systemVersion"];
    
    //  当前运行的系统
    [exceptionDic setValue:device.systemName forKey:@"systemName"];
    
    // 当前运行设备的模式
    [exceptionDic setValue:device.model forKey:@"systemModel"];
    
    // 当前运行设备的型号
    [exceptionDic setValue:[NSString getDeviceName] forKey:@"DeviceName"];
    
    // 系统时间
    [exceptionDic setValue:[NSDate getCurrentDate] forKey:@"systemDate"];
    
    //  错误来源 （调用栈）
    [exceptionDic setValue:[exception callStackSymbols] forKey:@"callStackSymbols"];
    
    //  错误描述
    [exceptionDic setValue:[exception reason] forKey:@"reason"];
    
    //  异常名
    [exceptionDic setValue:[exception name] forKey:@"name"];
    
    [[UIApplication sharedApplication].delegate performSelector:@selector(saveException:) withObject:exceptionDic];
}

/**
 * 保存错误信息到沙盒
 */
- (void)saveException:(NSMutableDictionary*)dic {

    // 将错误信息写入文件
    [dic writeToFile:filePath atomically:YES];
    
}

/**
 * 从沙盒读取错误信息
 */
- (NSDictionary *)readException {

    NSDictionary *exception = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    return exception;
}

/**
 * 删除沙盒错误信息
 */
- (void)deleteException {

    NSFileManager *manager = [NSFileManager defaultManager];
    
    [manager removeItemAtPath:filePath error:nil];
}
@end
