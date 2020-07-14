package io.github.zileyuan.umeng_analytics_push_example;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.github.zileyuan.umeng_analytics_push.UmengAnalyticsPushFlutterAndroid;

import com.umeng.message.PushAgent;


public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        PushAgent.getInstance(this).setResourcePackageName("io.github.zileyuan.umeng_analytics_push_example");
    }

    @Override
    protected void onResume() {
        super.onResume();
        UmengAnalyticsPushFlutterAndroid.androidOnResume(this);
    }

    @Override
    protected void onPause() {
        super.onPause();
        UmengAnalyticsPushFlutterAndroid.androidOnPause(this);
    }
}
