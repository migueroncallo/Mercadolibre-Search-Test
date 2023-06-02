//
//  Meli_Search_TestApp.swift
//  Meli Search Test
//
//  Created by Wow Wedding Photography on 30/05/23.
//

import SwiftUI
import ComposableArchitecture
import IQKeyboardManagerSwift

@main
struct Meli_Search_TestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SearchItemsView(
                store: Store(initialState: SearchItemsFeature.State()) {
                    SearchItemsFeature()
                        .signpost()
                        ._printChanges()
                }
            )
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        return true
    }
}
