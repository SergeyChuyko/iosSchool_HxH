//
//  SceneDelegate.swift
//  iosSchool_HxH
//
//  Created by Sergo on 19.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var appCoordinator: AppCoordinator? = {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.assembly.appCoordinator()
        }
        return nil
    }()

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        appCoordinator?.start(window: window)
    }
}
