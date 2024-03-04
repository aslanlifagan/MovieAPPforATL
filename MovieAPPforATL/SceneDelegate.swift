//
//  SceneDelegate.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create a new UIWindow with the given scene
        let newWindow = UIWindow(windowScene: windowScene)
        
        // Create your new root view controller
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarController") as? TabbarController ?? TabbarController()
        // Set the new root view controller
        let navigationController = UINavigationController(rootViewController: vc)
        newWindow.rootViewController = navigationController
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmZjOTk4YmQwMDNlYmY4NjExNjE4NzQzODgxODYxNCIsInN1YiI6IjY1ZGIxZTAyOWI2ZTQ3MDE4NjAwYWI4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fzVDj8_nT9CH8dIMRHCSICGu-FnWbH08kvtYmY6m4ag" // bu melumat bize login requesti atdighimiz zaman backden gelecek
        let data = token.data(using: .utf8)!
        let savetoken = KeychainHelper.saveData(data: data, forService: "token")
        if savetoken {
            print("save token")
        } else {
            print("save token error")
        }
        
        // Make the window visible
        window = newWindow
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

