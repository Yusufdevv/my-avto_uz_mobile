package org.uicgroup.avto.uz


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.BroadcastReceiver
import android.os.Bundle
import android.content.Context
import android.content.Intent
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity : FlutterActivity() {
    private val CHANNEL = "https.avto.uz/channel"
    private var startString: String? = null
    private val EVENTS = "https.avto.uz/events"
    private var linksReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "initialLink") {
                if (startString != null) {
                    result.success(startString)
                }
            }
        }
        EventChannel(flutterEngine.dartExecutor, EVENTS).setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(args: Any?, events: EventSink) {
                        linksReceiver = createChangeReceiver(events)
                    }
                    override fun onCancel(args: Any?) {
                        linksReceiver = null
                    }
                }
        )


    }


    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (intent.action === Intent.ACTION_VIEW) {
            linksReceiver?.onReceive(this.applicationContext, intent)
        }
    }


    fun createChangeReceiver(events: EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) { // NOTE: assuming intent.getAction() is Intent.ACTION_VIEW
                val dataString = intent.dataString ?:
                events.error("UNAVAILABLE", "Link unavailable", null)
                events.success(dataString)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val intent = getIntent()
        startString = intent.data?.toString()

    }
}