import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = ColorGenerator(alpha: 1)
        generator.changeColorCodes { colorCodes in
            print(colorCodes)
        }
        generator.changeColor {
            [4,3, 10500]
            
        }
    }
}
