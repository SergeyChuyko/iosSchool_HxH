//
//  PersonViewController.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

class PersonViewController<View: PersonView>: BaseViewController<View> {

    private let dataProvider: PersonDataProvider
    private let episodes: [String]

    init(dataProvider: PersonDataProvider, data: CharactersCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodes = data.episodes
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        rootView.setView()
        rootView.update(data: .init(image: nil, episodeUrl: episodes, episodeHeader: .init()))
    }

    private func setupBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "trash"),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }

    @objc private func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
