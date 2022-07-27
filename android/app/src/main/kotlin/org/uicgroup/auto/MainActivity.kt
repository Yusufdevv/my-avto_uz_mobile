package org.uicgroup.auto

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine;
import androidx.annotation.NonNull;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("3c85ce8e-de87-4f76-b2b6-75950aa4d567")
        super.configureFlutterEngine(flutterEngine)
    }

}
