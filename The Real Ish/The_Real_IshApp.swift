//
//  The_Real_IshApp.swift
//  The Real Ish
//
//  Created by Wendy Buhler on 9/3/21.
//

import SwiftUI
import Firebase

@main
struct The_Real_IshApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var user = User()
    @StateObject private var items = itemListViewModel()
    @StateObject private var firebaseViewModel = FirebaseViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.red)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.red)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
            .environmentObject(firebaseViewModel)
            .environmentObject(items)
            .environmentObject(user)
            .preferredColorScheme(.dark)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
