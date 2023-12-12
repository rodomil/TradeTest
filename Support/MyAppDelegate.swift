//
//  MyAppDelegate.swift
//  TradeTest
//
//  Created by Rodomil on 16.11.2023.
//

import UIKit
import SwiftUI

class MyAppDelegate: NSObject, UIApplicationDelegate {
     func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
 
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in
                    // Possibility handle the result of the authorization
                }
            )
        return true
    }
}

// MARK: - UNUserNotificationCenterDelegate
extension MyAppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        // Handle receiving of notification
    }
    
    // Needed if notifications should be presented while the app is in the foreground
    func userNotificationCenter(
        _: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.list, .banner, .sound])
    }
}
