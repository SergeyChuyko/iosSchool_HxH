//
//  RootTab.swift
//  iosSchool_HxH
//
//  Created by Sergo on 23.11.2023.
//

import UIKit

enum RootTab: Int {
    case locations = 0
    case cabinet = 1

    var tabBarItem: UITabBarItem {
        let tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: self.rawValue
        )
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "iceberg-color")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 10),
            .foregroundColor: UIColor.black
        ]
        tabBarItem.standardAppearance = appearance
        return tabBarItem
    }

    private var title: String? {
        switch self {
        case .locations:
            return "Выбор планеты"
        case .cabinet:
            return "Профиль"
        }
    }

    private var image: UIImage? {
        switch self {
        case .locations:
            return UIImage(named: "locations-image")?.withRenderingMode(.alwaysOriginal)
        case .cabinet:
            return UIImage(named: "cabinet-image")?.withRenderingMode(.alwaysOriginal)
        }
    }
}
