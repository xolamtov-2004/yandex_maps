package com.example.yandex_map;

import android.app.Application;

import com.yandex.mapkit.MapKitFactory;
public class MainApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        MapKitFactory.setLocale("en_US"); // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("8e2c8e84-1765-4aac-8734-77b84d7848ff"); // Your generated API key
    }
}
