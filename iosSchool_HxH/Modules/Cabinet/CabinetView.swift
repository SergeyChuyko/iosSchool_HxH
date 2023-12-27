//
//  CabinetView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 16.12.2023.
//

import Foundation
import UIKit

protocol CabinetView: UIView {
    func setView()
    func update(data: CabinetViewData)
}

class CabinetViewImp: UIView, CabinetView {

    private var sections: [CoreSection] = []

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        collectionView.backgroundColor = UIColor(named: "background-color")
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.showsVerticalScrollIndicator = false
    }

    func update(data: CabinetViewData) {
        sections = [
            Sections.avatarSection.create(data: data),
            Sections.loginSection.create(data: data),
            Sections.dateSection.create(data: data),
            Sections.exitSection.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private enum Sections: Int {
        case avatarSection
        case loginSection
        case dateSection
        case exitSection

        func create(data: CabinetViewData) -> CoreSection {
            switch self {
            case .avatarSection:
                return CabinetAvatarSection(cellsData: [data.cabinetAvatarData])
            case .loginSection:
                return CabinetLoginSection(cellsData: [data.cabinetLoginData])
            case .dateSection:
                return CabinetDateSection(cellsData: data.cabinetDateData)
            case .exitSection:
                return CabinetExitSection(cellsData: [data.episodeExitData])
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

extension CabinetViewImp: UICollectionViewDataSource {

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
            indexPath: indexPath) ?? UICollectionViewCell()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        return sections[indexPath.section].reusableView(
            collectionView: collectionView,
            indexPath: indexPath,
            kind: kind
        ) ?? UICollectionReusableView()
    }
}

// MARK: - UICollectionViewDelegate

extension CabinetViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.row)
    }
}

private extension CabinetViewImp {
    typealias CabinetAvatarSection = Section<CabinetAvatarCell, EmptyReusableView, EmptyReusableView>
    typealias CabinetLoginSection = Section<CabinetLoginCell, EmptyReusableView, EmptyReusableView>
    typealias CabinetDateSection = Section<CabinetDateCell, EmptyReusableView, EmptyReusableView>
    typealias CabinetExitSection = Section<CabinetExitCell, EmptyReusableView, EmptyReusableView>
}
