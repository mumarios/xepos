//
//  AppDelegate.swift
//  Xonder
//
//  Created by Daniyal Waseem on 5/6/21.
//

import UIKit
import GooglePlaces
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyCCic8SUA4IDFdmxGZ-REwQToMPbcE8xds")
        GMSPlacesClient.provideAPIKey("AIzaSyCCic8SUA4IDFdmxGZ-REwQToMPbcE8xds")   
        return true
    }

    // MARK: UISceneSession Lifecycle

}

