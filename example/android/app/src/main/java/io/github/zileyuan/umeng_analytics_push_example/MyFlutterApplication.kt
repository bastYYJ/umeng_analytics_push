package io.github.zileyuan.umeng_analytics_push_example;

import io.flutter.app.FlutterApplication
import io.github.zileyuan.umeng_analytics_push.UmengAnalyticsPushFlutterAndroid
import io.github.zileyuan.umeng_analytics_push_example.Const
import org.android.agoo.huawei.HuaWeiRegister
import org.android.agoo.oppo.OppoRegister
import org.android.agoo.vivo.VivoRegister
import org.android.agoo.xiaomi.MiPushRegistar

class MyFlutterApplication: FlutterApplication() {
    override fun onCreate() {
        super.onCreate();
        UmengAnalyticsPushFlutterAndroid.androidInit(this, Const.app_key , "default",
                false,Const.message_secret , true)
    }
}