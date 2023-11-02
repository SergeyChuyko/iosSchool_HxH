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

    }
}
