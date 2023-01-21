package org.uicgroup.auto.uz

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MyApp : Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("b56a52a4-692e-47ec-948d-8dc742fb9f59")
    }
}