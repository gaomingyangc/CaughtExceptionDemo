//
//  NSDate+CurrentDate.m
//  Exceptionemo
//
//  Created by A11130321050034 on 17/4/16.
//  Copyright © 2017年 GMY. All rights reserved.
//

#import "NSDate+CurrentDate.h"

@implementation NSDate (CurrentDate)

+(NSString *)getCurrentDate {

    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}
@end
