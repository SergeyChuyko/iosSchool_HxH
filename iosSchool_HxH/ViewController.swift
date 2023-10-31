import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
first-homework
        var color = Color(red: 1, green: 1, blue: 1)
        color.alpha = .bright
        var nextColor = color
        nextColor.alpha = .average
        let generator  = ColorGenerator(alpha: 0.5)
        generator.alpha = 1
        let nextGeneretor = generator
        nextGeneretor.alpha = 1

        let generator = ColorGenerator(alpha: 1)
        generator.changeColorCodes { colorCodes in
            print(colorCodes)
        }
        generator.changeColor {
            [4,3, 10500]
            
        }
develop
    }
}
