//
//  AppDelegate.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 15/04/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpView()
        
        return true
    }

    // MARK: Private Methos
    func setUpView()  {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController()
        self.makeKeyAndVisible(vc)
    }
    func makeKeyAndVisible(_ controller: UIViewController){
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
    }

    
}

