//
//  LocationsCellData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 27.11.2023.
//

import Foundation

struct LocationsCellData {
    let name: String
    let type: String
    let residents: [String]

    let populationText: String



    init(location: Location) {
        name = location.name
        type = location.type
        residents = location.residents

        populationText = "Население: " + String(residents.count)


    }
}
