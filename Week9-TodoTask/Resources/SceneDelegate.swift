//
//  SceneDelegate.swift
//  Week9-TodoTask
//
//  Created by King Bileygr on 3/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let ourWindowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: ourWindowScene.coordinateSpace.bounds)
        window?.windowScene = ourWindowScene
        window?.rootViewController = TodoListViewController()
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

