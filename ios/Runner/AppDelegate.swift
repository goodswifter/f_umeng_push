import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    UMConfigure.initWithAppkey("62f9abcc79848655fadc253a", channel: nil);
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
   // 如果需要处理Push点击，用下面代码
//   @available(iOS 10.0, *)
//   override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//       let userInfo = response.notification.request.content.userInfo
//       UmengAnalyticsPushFlutterIos.handleMessagePush(userInfo)
//       completionHandler()
//   }
}
