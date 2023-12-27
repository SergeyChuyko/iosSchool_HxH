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
    func lastEntryDate() -> Date?
    func saveLastEntryDate()
    func saveRegisterLogin(registerLogin: String)
    func getRegisterLogin() -> String
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
    func lastEntryDate() -> Date? {
        UserDefaults.standard.object(forKey: StorageManagerKey.lastEntryDate.rawValue) as? Date
    }

    func saveLastEntryDate() {
        UserDefaults.standard.set(Date(), forKey: StorageManagerKey.lastEntryDate.rawValue)
    }

    func saveRegisterLogin(registerLogin: String) {
        UserDefaults.standard.set(registerLogin, forKey: StorageManagerKey.registerLogin.rawValue)
    }

    func getRegisterLogin() -> String {
        UserDefaults.standard.object(forKey: StorageManagerKey.registerLogin.rawValue) as? String ?? "Default Login"
    }
}

private extension StorageManagerImp {
    enum StorageManagerKey: String {
        case token
        case notFirstLaunch
        case lastEntryDate
        case registerLogin
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
