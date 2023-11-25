//
//  SplashView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 09.11.2023.
//

import Foundation
import UIKit

protocol SplashView: UIView {
    func setViewSplash()
}

class SplashViewImp: UIView, SplashView {

    @IBOutlet var labelView: UILabel!
    @IBOutlet var upLabel: UILabel!
    @IBOutlet var downLabel: UILabel!

    @IBOutlet var substructImageView: UIImageView!
    @IBOutlet var rectangle17: UIView!
    @IBOutlet var rectangle18: UIView!

    func setViewSplash() {
        backgroundColor = UIColor(named: "iceberg-color")
        substructImageView.image = UIImage(named: "substract")

        labelView.textColor = .white
        labelView.font = UIFont(name: "PressStart2P-Regular", size: 16)
        labelView.text = "IT SCHOOL"

        upLabel.textColor = .white
        downLabel.textColor = .white
        setViews(to: rectangle17)
        setViews(to: rectangle18)
        rectangle18.layer.cornerRadius = 2
    }

    func setViews(to view: UIView) {
        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }

}
