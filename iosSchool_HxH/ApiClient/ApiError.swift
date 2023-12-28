//
//  ApiError.swift
//  iosSchool_HxH
//
//  Created by Sergo on 13.11.2023.
//

import Foundation

enum ApiError: Error {
    case dataParsing
    case serverError
    case common(Data?)

    var rawValue: String {
        switch self {
        case .dataParsing:
            return "Ошибка парсинга"
        case .serverError:
            return "Ошибка получения данных"
        case let .common(data):
            guard let data = data else {
                return "Упс! Что-то пошло не так"
            }
            return String(decoding: data, as: UTF8.self)
        }
    }
}
