//
//  AppDelegate.swift
//  Rockets
//
//  Created by Marco Domingues on 09/06/2021.
//

import UIKit
import RocketsNetwork

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRocketsNetwork()
        
        let viewModel = RocketListViewModel()
        let vc = RocketListViewController(viewModel: viewModel)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        
        return true
    }

}

// MARK: - RocketsNetwork

extension AppDelegate {
    
    private func setupRocketsNetwork() {
        guard let plistPath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            assert(false, "Missing configuration file.")
            return
        }
        
        do {
            try RocketsNetwork.shared.configure(with: plistPath)
        } catch {
            assert(false, error.localizedDescription)
            return
        }
    }
    
}
