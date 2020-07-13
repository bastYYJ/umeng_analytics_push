#import <Flutter/Flutter.h>

@interface UmengAnalyticsPushFlutterIos : NSObject

+ (void)iosInit:(NSDictionary *_Nullable)launchOptions appkey:(NSString *)appkey channel:(NSString *)channel logEnabled:(BOOL)logEnabled pushEnabled:(BOOL)pushEnabled;
+ (void)handleCustomMessagePush:(NSDictionary *)userInfo;

<<<<<<< HEAD
@end
=======
@end
>>>>>>> d11639ab7e9dd6f46d79ecffebbcb1062b3d2611
