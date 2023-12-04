//
//  StorageManager.swift
//  iosSchool_HxH
//
//  Created by Sergo on 04.12.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func saveToken(token: TokenResponse)
    func getToken() -> TokenResponse?
    func removeTokern()
}

class StorageManagerImp: StorageManager {

    private let keyChain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !isNotFirstLaunch() else {
            return
        }
        do {
            try keyChain.removeAll()
        } catch {
            print(error as Any)
        }
        saveFirstLaunch()

    }

    func saveToken(token: TokenResponse) {
        do {
            try keyChain.set(token.token, key: StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keyChain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }
            return TokenResponse(token: token)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeTokern() {
        do {
            try keyChain.remove(StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }

    }
}

private extension StorageManagerImp {
    enum StorageManagerKey: String {
        case token
        case notFirstLaunch
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychein"
    }

    func isNotFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
