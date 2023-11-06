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
            return ""
        }
        let functiongNumberThree = characterGenerator.generateNameTree()
        functiongNumberThree("MEGABRAIN007")
        let functiongNumberFour = characterGenerator.generateNameFour()
        let forFour = functiongNumberFour()
        print(forFour)

        view.backgroundColor = .darkGray
        let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = arrayInt.filter { elem in
            elem % 2 == 0
        }
        print(result)
        let result1 = arrayInt.filter { $0 % 2 == 0}
        print(result1)
        let array: [Double] = [1, 2, 3, 4, 5, 6]
        _ = array.map { ColorGenerator(alpha: $0) }
        _ = array.map { alpha -> ColorGenerator? in
            guard alpha < 1 else {
                return nil
            }
            return ColorGenerator(alpha: alpha)
        }

        let test1: [ColorGenerator?] = array.map {
            guard $0 < 1 else {
                return nil
            }
            return ColorGenerator(alpha: $0)
        }
        _ = test1.compactMap { $0 }
        _ = test1.compactMap { $0?.alpha }
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        let resultReducde = arr.reduce(1) { result, number in
            result * number
        }
        print(resultReducde)
    }
}
