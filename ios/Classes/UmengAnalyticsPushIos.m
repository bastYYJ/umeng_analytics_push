#import "UmengAnalyticsPushIos.h"
#import <UMCommon/UMCommon.h>
<<<<<<< HEAD
#import <UMPush/UMessage.h>
#import <UserNotifications/UserNotifications.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
#include <arpa/inet.h>
=======
#import <UMAnalytics/MobClick.h>
#import <UMPush/UMessage.h>
#import <UserNotifications/UserNotifications.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
>>>>>>> d11639ab7e9dd6f46d79ecffebbcb1062b3d2611

extern FlutterEventSink _eventSink;
@implementation UmengAnalyticsPushFlutterIos

// 初始化友盟
+ (void)iosInit:(NSDictionary *_Nullable)launchOptions appkey:(NSString *)appkey channel:(NSString *)channel logEnabled:(BOOL)logEnabled pushEnabled:(BOOL)pushEnabled {
    [UMConfigure setLogEnabled:logEnabled];
    [UMConfigure initWithAppkey:appkey channel:channel];
    NSLog(@"application init umeng ok");
    if (pushEnabled) {
        // Push组件基本功能配置
        UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
        //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
        entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionSound|UMessageAuthorizationOptionAlert;
        [UNUserNotificationCenter currentNotificationCenter].delegate=self;
        [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                NSLog(@"================= PUSH授权成功 ====================");
            }else{
                NSLog(@"================= PUSH拒绝授权 ====================");
            }
        }];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationFuncion:) name:@"umeng_analytics_push" object:nil];
    }
}

// 处理友盟推送
+ (void)handleCustomMessagePush:(NSDictionary *)userInfo {
<<<<<<< HEAD
    NSLog(@"================= 收到 ====================");
=======
>>>>>>> d11639ab7e9dd6f46d79ecffebbcb1062b3d2611
    if (userInfo)
    {
        if ([userInfo objectForKey:@"custom_message"])
        {
            NSString *custom = userInfo[@"custom_message"];
            //通知到Flutter
            _eventSink(custom);
        }
    }
}

@end