package org.uicgroup.auto

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MyApp : Application() {

    override fun onCreate() {
        super.onCreate()
        println("my app log")
        MapKitFactory.setApiKey("b56a52a4-692e-47ec-948d-8dc742fb9f59")
    }
}