//
//  LocationsList.swift
//  iosSchool_HxH
//
//  Created by Sergo on 13.11.2023.
//

import Foundation

struct LocationsList: Decodable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [Location]
}
