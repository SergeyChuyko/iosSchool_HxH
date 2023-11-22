//
//  RegistrationApiClient.swift
//  iosSchool_HxH
//
//  Created by Sergo on 20.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let data = try? JSONSerialization.data(withJSONObject: ["username": username, "password": password])
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register"
        performRequest(url: url, data: data, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
