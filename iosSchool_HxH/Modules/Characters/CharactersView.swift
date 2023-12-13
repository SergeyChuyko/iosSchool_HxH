//
//  CharactersView.swift
//  iosSchool_HxH
//
//  Created by Sergo on 21.11.2023.
//

import Foundation
import UIKit

protocol CharactersView: UIView {
    func setView()
    func update(date: CharactersViewData)
    func updateCharacter(index: Int, with data: CharactersCellData)
}

class CharactersViewImp: UIView, CharactersView {

    private var section: CoreSection?

    lazy var collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: layout())
    }()

    func setView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.contentInset = UIEdgeInsets(top: CGFloat(59), left: 0, bottom: CGFloat(59), right: 0)
        collectionView.showsVerticalScrollIndicator = false
    }

    func update(date: CharactersViewData) {
        section = CharactersSection(cellsData: date.cells)
        section?.registrate(collectionView: collectionView)
        collectionView.reloadData()
    }

    func updateCharacter(index: Int, with data: CharactersCellData) {
        section?.updateCell(at: IndexPath(item: index, section: 0), with: data)
        guard let cell = section?.cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: index, section: 0)
        ) as? CharactersCell else {
            return
        }
        cell.update(with: data)
    }

    // MARK: Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let charactrersSection = self.section else {
                return nil
            }

            guard let layoutSection = charactrersSection.sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension CharactersViewImp: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section?.numberOfItem ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        section?.cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()

    }

}

// MARK: - UICollectionViewDelegate
extension CharactersViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        section?.selectCell(at: indexPath.item)
    }
}

private extension CharactersViewImp {
    typealias CharactersSection = Section<CharactersCell, EmptyReusableView, EmptyReusableView>
}
