//
//  DateManager.swift
//  iosSchool_HxH
//
//  Created by Sergo on 22.12.2023.
//

import Foundation

protocol DateManager {
    func format(date: Date) -> String
}

class DateManagerImp: DateManager {
    private let dateFormatter: DateFormatter

    init() {
        self.dateFormatter = DateFormatter()
    }

    func format(date: Date) -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}
