//
//  SceneDelegate.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: UIViewController())
        window?.makeKeyAndVisible()
    }
}

