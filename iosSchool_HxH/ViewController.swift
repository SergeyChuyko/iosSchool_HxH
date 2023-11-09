import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let characterGenerator = CharacterGenerator()
        let characterGeneratorProtocol: CharacterGeneratorProtocol = characterGenerator

        guard characterGenerator === characterGeneratorProtocol else {
            print("characterGenerator и characterGenerator - разные объекты")
            return
        }
        print("characterGenerator и characterGenerator - один и тот же объект")

        characterGenerator.generateNameOne { name in
            print(name)
        }
        characterGenerator.generateNameTwo {
            return "SomeNameTestForSecondGenerator"
        }
        let functiongNumberThree = characterGenerator.generateNameTree()
        functiongNumberThree("SomeNameTest")
        let functiongNumberFour = characterGenerator.generateNameFour()
        let forFour = functiongNumberFour()
        print(forFour)

        var characters: [Character] = []

        for _ in 1...10 {
            let generatedCharacter = characterGenerator.generateSomeCharacter()
            characters.append(generatedCharacter)
        }

        let maleCharacters = characters.filter { $0.gender == .male }
        print("Все персонажи:")
        characters.forEach { print($0.name, "-", $0.gender.rawValue) }
        print("\nМужские персонажи:")
        maleCharacters.forEach { print($0.name, "-", $0.gender.rawValue) }
    }
}
