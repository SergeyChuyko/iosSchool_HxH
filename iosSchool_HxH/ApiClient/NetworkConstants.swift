//
//  NetworkConstants.swift
//  iosSchool_HxH
//
//  Created by Sergo on 13.11.2023.
//

import Foundation

struct NetworkConstants {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
    }

    struct URLStrings {
        static let nanoPost = "https://nanopost.evolitist.com/api"
        static let locationURL = "https://rickandmortyapi.com/api/location"
        static let characterURL = "https://rickandmortyapi.com/api/character"
    }
}
