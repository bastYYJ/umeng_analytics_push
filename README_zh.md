# 友盟分析推送Flutter插件（umeng_analytics_push） [![pub package](https://img.shields.io/pub/v/umeng_analytics_push)](https://pub.flutter-io.cn/packages/umeng_analytics_push)

- 语言: [English](https://github.com/bastYYJ/umeng_analytics_push) | [中文简体](https://github.com/bastYYJ/umeng_analytics_push/blob/master/README_zh.md)
- 友盟API详见: [umeng:analytics](http://mobile.umeng.com/analytics) & [umeng:push](http://mobile.umeng.com/push)

## 用法

### 导入


```yaml
dependencies:
  umeng_analytics_push:
      git:
        url: https://github.com/bastYYJ/umeng_analytics_push.git
```

### Android设置（以Kotlin示例）

#### 创建自定义FlutterApplication类作为启动类，如果不需要push功能则uemng_push_id设置为空，如果不需要自定义Push点击，则设置最后一个参数为false

```kotlin
package com.demo.umeng.app

import io.flutter.app.FlutterApplication
import io.github.zileyuan.umeng_analytics_push.UmengAnalyticsPushFlutterAndroid

class MyFlutterApplication: FlutterApplication() {
    override fun onCreate() {
        super.onCreate();
        UmengAnalyticsPushFlutterAndroid.androidInit(this, "uemng_app_key", "default",
                false, "uemng_message_secret", false)
    }
}
```

#### 修改MainActivity，增加Umeng的设置

```kotlin
package com.demo.umeng.app

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.github.zileyuan.umeng_analytics_push.UmengAnalyticsPushFlutterAndroid

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }

  override fun onResume() {
    super.onResume()
    UmengAnalyticsPushFlutterAndroid.androidOnResume(this)
  }

  override fun onPause() {
    super.onPause()
    UmengAnalyticsPushFlutterAndroid.androidOnPause(this)
  }
}
```

#### 修改AndroidManifest.xml文件

```xml
<application
  android:name="com.demo.umeng.app.MyFlutterApplication">
</application>
```

### IOS设置（以Swift示例）

#### 修改AppDelegate.swift文件，如果不需要Push功能则pushEnabled设置为false

```swift
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
     override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            GeneratedPluginRegistrant.register(with: self)
            UmengAnalyticsPushFlutterIos.iosInit(launchOptions, appkey:"uemng_app_key", channel:"appstore", logEnabled:false, pushEnabled:true);
            if #available(iOS 10.0, *) {
                    UNUserNotificationCenter.current().delegate = self
                }
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    
        // If you need to handle custom Push clicks, use the following code
           @available(iOS 10.0, *)
           override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
               let userInfo = response.notification.request.content.userInfo
               UmengAnalyticsPushFlutterIos.handleCustomMessagePush(userInfo)
               completionHandler()
           }
           
           override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
               let device = NSData(data: deviceToken)
               
               let deviceId = device.description.replacingOccurrences(of:"<", with:"").replacingOccurrences(of:">", with:"").replacingOccurrences(of:" ", with:"")
               
               NSLog("我的deviceToken：\(deviceId)")
           }
           
           override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
               UmengAnalyticsPushFlutterIos.handleCustomMessagePush(userInfo)
       
           }
           
           @available(iOS 10.0, *)
           override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
               completionHandler([.alert, .sound, .badge])
           }
}
```

#### 修改Runner-Bridging-Header.h文件

```objectivec
#import "GeneratedPluginRegistrant.h"
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
#import <UMPush/UMessage.h>
#import <UserNotifications/UserNotifications.h>
#import <umeng_analytics_push/UmengAnalyticsPushIos.h>
```

### Flutter中使用

#### 操作Alias

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.addAlias('1001', 'jobcode');
UmengAnalyticsPush.setAlias('1002', 'jobcode');
UmengAnalyticsPush.deleteAlias('1002', 'jobcode');
```

#### 操作Tags

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.addTags('manager');
UmengAnalyticsPush.deleteTags('manager');
```

#### 页面埋点操作

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.pageStart('memberPage');
UmengAnalyticsPush.pageEnd('memberPage');
```

#### 自定义事件

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.event('customEvent', '1000');
```

#### 自定义点击Push响应（需要初始化时候打开开关）

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';
// custom 为自定义参数 map
UmengAnalyticsPush.addPushCustomMessageCallback((custom) {
  print(custom);
});
```

#### 检查通知栏权限

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.isNotifyEnabled()；
```

#### 打开配置通知栏权限页面

```dart
import 'package:umeng_analytics_push/umeng_analytics_push.dart';

UmengAnalyticsPush.openPushSetting();
```

