//
//  PersonViewData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

struct PersonViewData {
    let avatarCellData: PersonAvatarCellData
    let episodeData: [PersonEpisodeCellData]
    let episodeHeader: PersonHeaderViewData

    init(image: UIImage?, episodeUrl: [String]) {
        self.avatarCellData = PersonAvatarCellData(image: image)
        self.episodeData = episodeUrl.compactMap { PersonEpisodeCellData(url: $0 )}
        episodeHeader = PersonHeaderViewData()
    }
}
