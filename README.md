# CaughtExceptionDemo
<p>收集的错误信息</p>
错误来源（调用栈）错误描述 异常名 当前系统的版本 当前运行的系统 当前运行设备的模式 当前运行设备的型号 系统时间 <br>
<p>搜集类的说明</p>
 "AppDelegate+CaughtException.h"类中一共提供四个方法可供使用。
 1.- (void)caughtExceptionHandler; // 捕获异常
 2.- (void)saveException:(NSMutableDictionary*)dic; // 保存错误信息到沙盒
 3.- (NSDictionary *)readException; // 从沙盒读取错误信息
 4.- (void)deleteException; // 删除沙盒错误信息
<p>使用方法</p>
1. 将CaughtExceptions文件夹拖到需要收集错误的project中去,在"AppDelegate.h"中引入头文件#import "AppDelegate+CaughtException.h"
2. 在didFinishLaunchingWithOptions方法中，调用caughtExceptionHandler来收集错误信息。并根据业务需求对错误数据进行操作
