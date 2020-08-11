//
//  AppDelegate.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 28.07.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FacebookCore
import FBSDKCoreKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var urlForFB: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase
        FirebaseApp.configure()
        // =================================================
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        AppLinkUtility.fetchDeferredAppLink { [weak self] (url, error) in
            guard let self = self else { return }
            if let error = error {
                print("Received error while fetching deferred app link %@", error)
            }
            if let url = url {
                print("url = \(url)")
                
                self.urlForFB = url.absoluteString
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.checkAccess()
                self.window?.makeKeyAndVisible()
            } else {
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.checkAccess()
                self.window?.makeKeyAndVisible()
            }
        }
        addOneSignal(launchOptions: launchOptions)
        // =================================================
        
        // Set default count of golden chips.
        if UserDefaults.standard.object(forKey: Constants.Keys.goldenChipsCount) == nil {
            UserDefaults.standard.set(200, forKey: Constants.Keys.goldenChipsCount)
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
    }
    
    // MARK: - Access
    func checkAccess() {
        if UserDefaults.standard.object(forKey: Constants.Keys.access) == nil || UserDefaults.standard.bool(forKey: Constants.Keys.access) == false {
            if let urlString = urlForFB {
                let webVC = WebViewController()
                webVC.url = urlString
                window?.rootViewController = webVC
            } else {
                window?.rootViewController = WebViewController()
            }
        } else {
            window?.rootViewController = ChooseViewController(viewModel: ChooseViewModel(),
                                                              chooseColorView: ChooseColorView(),
                                                              chooseDefendersView: ChooseDefendersView())
        }
    }
    
    func addOneSignal(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        //Remove this method to stop OneSignal Debugging 
        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        //START OneSignal initialization code
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false, kOSSettingsKeyInAppLaunchURL: false]
        // Replace 'YOUR_ONESIGNAL_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
          appId: "d4f523f3-ff08-42c7-b52c-d2e75fa7c1ba",
          handleNotificationAction: nil,
          settings: onesignalInitSettings)
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        // The promptForPushNotifications function code will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 6)
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
    }
}

