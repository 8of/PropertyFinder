//
//  AppDelegate.swift
//  PropertyFinder
//
//  Created by Andrei Konstantinov on 22/01/2019.
//  Copyright © 2019 8of. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Fixing custom content type for images
    DataRequest.addAcceptableImageContentTypes(["image/jpg"])
    let router = Router()
    router.setupRootViewController(on: window?.rootViewController)
    window?.makeKeyAndVisible()
    return true
  }
  
}

