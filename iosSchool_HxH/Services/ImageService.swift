//
//  ImageService.swift
//  iosSchool_HxH
//
//  Created by Sergo on 30.11.2023.
//

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
        if imageDictionary.count > 50 {
            imageDictionary.removeAll()
        }
        DispatchQueue.global().async { [weak self] in
            self?.apiClient.requestImageData(url: url) { imageData in
                guard let imageData,
                      let downloadedImage = UIImage(data: imageData) else {
                    self?.updateQueue.async {
                        completion(nil)
                    }
                    return
                }
                self?.updateQueue.async {
                    self?.imageDictionary[url] = downloadedImage
                    completion(downloadedImage)
                }
            }
        }
    }
}
