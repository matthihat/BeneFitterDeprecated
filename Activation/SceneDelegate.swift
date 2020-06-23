//
//  SceneDelegate.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

            guard let scene = (scene as? UIWindowScene) else { return }
            
            window = UIWindow(windowScene: scene)
            window?.makeKeyAndVisible()
            
            window?.rootViewController = createTabBar()
        }
        
        
        func createMainNC() -> UINavigationController {
            let mainCV = MainCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
            mainCV.title = "Main"
//            mainCV.tabBarItem = UITabBarItem(title: "Items", image: #imageLiteral(resourceName: "baseline_category_black_36dp"), tag: 0)
            
            return UINavigationController(rootViewController: mainCV)
        }
        
        func createProfileNC() -> UINavigationController {
            let profileVC = ProfileVC()
            profileVC.title = "main profile"
            profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            
            return UINavigationController(rootViewController: profileVC)
        }
        
        func configureBarAppearanceGlobally() {
    //        sets tab bar background color
            UITabBar.appearance().barTintColor = .systemYellow
            
            // Title text color Black => Text appears in white
            UINavigationBar.appearance().barStyle = .default

            // Translucency; false == opaque, can not be used if prefers large titles is true
    //        UINavigationBar.appearance().isTranslucent = false

            // BACKGROUND color of nav bar
            UINavigationBar.appearance().barTintColor = UIColor.systemYellow
            
            // Foreground color of bar button item text, e.g. "< Back", "Done", and so on.
            UINavigationBar.appearance().tintColor = UIColor.black
            
        }

        func createTabBar() -> UITabBarController{
            let tabbar = UITabBarController()
            tabbar.viewControllers = [createMainNC(), createProfileNC()]
            
            configureBarAppearanceGlobally()
            
            return tabbar
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
