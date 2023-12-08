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

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        apiClient.requestImageData(url: url) { [weak self] imageData in
            guard let self,
                  let imageData = imageData,
                  let downloadedImage = UIImage(data: imageData) else {
                self?.updateQueue.async { completion(nil) }
                return
            }

            self.updateQueue.async {
                self.imageDictionary[url] = downloadedImage
                if (self.imageDictionary.count) > 50 {
                    self.imageDictionary.removeAll()
                }
                completion(downloadedImage)
            }
        }
    }
}
