//
//  AppDelegate.swift
//  freeze
//
//  Created by Anmol Seth on 3/12/19.
//  Copyright © 2019 freeze. All rights reserved.
//
import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    private let healthStore = HKHealthStore()
    
    var window: UIWindow?
    
    // MARK: - Lifecycle
    
    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
    
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        // Authorize access to health data for watch.
        healthStore.handleAuthorizationForExtension { success, error in
            print(success)
        }
    }
    
}
