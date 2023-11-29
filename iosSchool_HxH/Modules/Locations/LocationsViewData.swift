//
//  LocationsViewData.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation

struct LocationsViewData {
    let cellsData: [LocationsCellData]

    init(list: LocationsList) {
        cellsData = list.results.map { LocationsCellData(location: $0) }
    }
}
