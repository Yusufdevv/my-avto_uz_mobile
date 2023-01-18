package org.uicgroup.auto

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("341cdf84-6562-4231-9c00-8d00f5da4fd4") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
