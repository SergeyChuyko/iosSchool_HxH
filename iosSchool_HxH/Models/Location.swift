//
//  Locations.swift
//  iosSchool_HxH
//
//  Created by Sergo on 13.11.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
