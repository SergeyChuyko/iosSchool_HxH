//
//  PersonViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonViewController<View: PersonView>: BaseViewController<View> {

    private let dataProvider: PersonDataProvider
    private var episodes: [Episode] = []
    private let episodesUrlList: [String]
    private let imageService: ImageService
    private let imageUrl: String?
    private let updateQueue = DispatchQueue(label: "EpisodeRequestQueue")

    init(dataProvider: PersonDataProvider, data: CharactersCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodesUrlList = data.episodes
        self.imageService = imageService
        self.imageUrl = data.imageUrl
        super.init(nibName: nil, bundle: nil)
        title = data.name
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        rootView.setView()
        imageService.getImage(url: imageUrl ?? "") { [weak self] image in
            guard let self = self, let image = image else {
                return
            }
            DispatchQueue.main.async {
                self.rootView.update(data: .init(image: image, episodeUrl: self.episodesUrlList))
            }
        }

        episodesUrlList.enumerated().forEach { idx, url in
            requestEpisode(url: url) { [weak self] episode in
                guard let self else {
                    return
                }
                DispatchQueue.main.async {
                    self.rootView.updateEpisode(
                        idx: idx,
                        with: PersonEpisodeCellData(
                            episode: episode
                        )
                    )
                }
            }
        }
    }

    private func requestEpisode(url: String, completion: @escaping (Episode) -> Void) {
        DispatchQueue.global().async {
            self.dataProvider.episode(url: url) {[weak self]  episode, error in
                guard let episode = episode else {
                    print(error ?? "ERROR")
                    return
                }
                self?.updateQueue.async {
                    self?.episodes.append(episode)
                    completion(episode)
                }
            }
        }
    }

    private func setupBackButton() {
        let backButton = UIBarButtonItem(
            image: UIImage(named: "backButtonPlaceholder-image")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
