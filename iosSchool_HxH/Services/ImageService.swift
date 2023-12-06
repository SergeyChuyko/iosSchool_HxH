//
//  ImageService.swift
//  iosSchool_HxH
//
//  Created by Sergo on 30.11.2023.
//

import Foundation
import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {

    private var imageDictionary: [String: UIImage] = [:]
    private var imageLimit = 50

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageDictionary[url] {
            completion(cachedImage)
            return
        }
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: url),
                  let imageData = try? Data(contentsOf: imageUrl),
                  let downloadedImage = UIImage(data: imageData) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            self.imageDictionary[url] = downloadedImage

            if self.imageDictionary.count > self.imageLimit {
                let keysToRemove = Array(self.imageDictionary.keys.prefix(self.imageLimit))
                for key in keysToRemove {
                    self.imageDictionary.removeValue(forKey: key)
                }
            }
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }
    }
}
