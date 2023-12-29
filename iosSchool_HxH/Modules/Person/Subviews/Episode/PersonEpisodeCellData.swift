//
//  PersonEpisodeCellData.swift
//  iosSchoolHH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

struct PersonEpisodeCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let name: String?
    let airDate: String?
    let number: String

    init(episode: Episode) {
        name = episode.name
        airDate = episode.airDate
        number = "\(episode.id)"
    }

    init?(url: String) {
        guard let url = URL(string: url) else {
            return nil
        }
        number = url.lastPathComponent
        name = nil
        airDate = nil
    }
}
