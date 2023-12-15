//
//  PersonViewData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

struct PersonViewData {
    let photoCellData: PersonAvatarCellData
    let episodeData: [PersonEpisodeCellData]
    let episodeHeader: PersonHeaderViewData

    init(image: UIImage?, episodeUrl: [String], episodeHeader: PersonHeaderViewData) {
        self.photoCellData = PersonAvatarCellData()
        self.episodeData = episodeUrl.compactMap { PersonEpisodeCellData(url: $0 )}
        self.episodeHeader = PersonHeaderViewData()
    }
}
