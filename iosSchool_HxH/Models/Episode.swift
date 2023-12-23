//
//  File.swift
//  iosSchool_HxH
//
//  Created by Sergo on 18.12.2023.
//

import Foundation

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case url
    }
}
