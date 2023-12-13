import Foundation
import UIKit

class CharactersViewController<View: CharactersView>: BaseViewController<View> {

    private var characters: [Character] = []
    private let charactersDataProvider: CharactersDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageSerivce: ImageService

    init(charactersDataProvider: CharactersDataProvider, data: LocationsCellData, imageSerivce: ImageService) {
        self.charactersDataProvider = charactersDataProvider
        charactersUrlList = data.residents
        self.imageSerivce = imageSerivce
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter(id: 5)
        view.backgroundColor = UIColor(named: "background-color")
        rootView.setView()
        rootView.update(date: CharactersViewData(cells: charactersUrlList.map { CharactersCellData(url: $0) }))
        charactersUrlList.enumerated().forEach { index, url in
            requestCharacher(url: url) { [weak self] character in
                print(character.name)

                self?.imageSerivce.getImage(url: character.image, completion: { image in
                    print(image ?? 0)

                    guard let self = self else {
                        return
                    }

                    DispatchQueue.main.async {
                        self.rootView.updateCharacter(index: index, with: CharactersCellData.init(
                            character: character,
                            isLoading: true,
                            image: image,
                            selectClosure: nil
                        ))
                    }

                    self.imageSerivce.getImage(url: character.image, completion: { image in
                        print(image?.size ?? 0)
                    })
                })
            }
        }
    }

    func getCharacter(id: Int) {
        charactersDataProvider.getCharacter(id: id) { character, error in
            print(character ?? "No character")
            print(error?.rawValue ?? "No error")
        }
    }

    private func requestCharacher(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.charactersDataProvider.character(url: url) { [weak self] character, error in
                if let character = character {
                    self?.updateQueue.async {
                        self?.characters.append(character)
                        completion(character)
                    }
                } else {
                    print(error ?? "error")
                }
            }
        }
    }
}
