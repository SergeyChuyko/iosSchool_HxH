//
//  ApiError.swift
//  iosSchool_HxH
//
//  Created by Sergo on 13.11.2023.
//

import Foundation

enum ApiError: Error {
    case dataParsing, serverError, common(Data?)

    var rawValue: String {
        switch self {
        case .dataParsing:
            return "Ошибка парсинга"
        case .serverError:
            return "Ошибка получения данных"
        case let .common(data):
            if let data {
                return String(decoding: data, as: UTF8.self)
            } else {
                return "Упс! Чтото пошло не так"
            }
        }
    }
}