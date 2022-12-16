import UIKit
import Flutter
import YandexMapsMobile
import workmanager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    YMKMapKit.setApiKey("341cdf84-6562-4231-9c00-8d00f5da4fd4")
    WorkmanagerPlugin.registerTask(withIdentifier: "announcementPublishing")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
