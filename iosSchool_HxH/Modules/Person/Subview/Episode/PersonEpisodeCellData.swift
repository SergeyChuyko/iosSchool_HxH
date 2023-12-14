//
//  PersonEpisodeCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

struct PersonEpisodeCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let number: String
    init?(url: String) {
        guard let url = URL(string: url) else {
            return nil
        }
        number = url.lastPathComponent
    }

}





















//    let url: String
//    let isLoading: Bool
//    let name: String?
//    let episodes: [String]
//    let imageUrl: String?
//    let image: UIImage?
//
//    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
//        url = character.url
//        self.isLoading = isLoading
//        name = character.name
//        episodes = character.episode
//        imageUrl = character.image
//        self.image = image
//    }
//
//    init(url: String) {
//        self.url = url
//        isLoading = true
//        name = nil
//        episodes = []
//        imageUrl = nil
//        image = nil
//    }

