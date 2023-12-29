//
//  SplashView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 09.11.2023.
//

import UIKit

protocol SplashView: UIView {
    func setViewSplash()
}

class SplashViewImp: UIView, SplashView {
    @IBOutlet var launchImageView: UIImageView!

    func setViewSplash() {
        backgroundColor = UIColor(named: "iceberg-color")
        launchImageView.image = UIImage(named: "launch-image")
    }
}
