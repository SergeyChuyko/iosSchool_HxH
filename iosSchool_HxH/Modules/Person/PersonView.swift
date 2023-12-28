//
//  PersonView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 14.12.2023.
//

import UIKit

protocol PersonView: UIView {
    func setView()
    func update(data: PersonViewData)
    func updateEpisode(idx: Int, with data: PersonEpisodeCellData)
}

class PersonViewImp: UIView, PersonView {
    private var sections: [CoreSection] = []
    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        self.backgroundColor = UIColor(named: "silver")
        collectionView.backgroundColor = UIColor(named: "background-color")
        collectionView.dataSource = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.showsVerticalScrollIndicator = false
    }

    func update(data: PersonViewData) {
        sections = [
            Sections.avatarSection.create(data: data),
            Sections.episodes.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    func updateEpisode(idx: Int, with data: PersonEpisodeCellData) {
        guard let sectionIdx = sections.firstIndex(where: { $0 is PersonEpisodeSection }) else {
            return
        }
        sections[sectionIdx].updateCell(at: IndexPath(item: idx, section: sectionIdx), with: data)
        guard let cell = sections[sectionIdx].cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: idx, section: sectionIdx)
        ) as? PersonEpisodeCell else {
            return
        }
        cell.update(with: data)
    }

    // MARK: - Private methods

    private enum Sections: Int {
        case avatarSection
        case episodes

        func create(data: PersonViewData) -> CoreSection {
            switch self {
            case .avatarSection:
                return PersonAvatarSection(cellsData: [data.avatarCellData])
            case .episodes:
                return PersonEpisodeSection(cellsData: data.episodeData, headerData: data.episodeHeader)
            }
        }
    }

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let layoutSection = sections[section] .sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension PersonViewImp: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(
            collectionView: collectionView,
            indexPath: indexPath
        ) ?? UICollectionViewCell()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
            sections[indexPath.section].reusableView(
                collectionView: collectionView,
                indexPath: indexPath, kind: kind
            ) ?? UICollectionReusableView()
        }
}

private extension PersonViewImp {
    typealias PersonAvatarSection = Section<PersonAvatarCell, EmptyReusableView, EmptyReusableView>
    typealias PersonEpisodeSection = Section<PersonEpisodeCell, PersonHeaderView, EmptyReusableView>
}
