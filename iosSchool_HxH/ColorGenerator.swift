import Foundation
import UIKit

struct Color {
    var alpha: Brightness
    let red: Double
    let green: Double
    let blue: Double
    func description() {
        print("R: \(red), ALPHA: \(alpha.rawValue)")
    }
    init(red: Double, green: Double, blue: Double) {
        self.alpha = .dim
        self.red = red
        self.green = green
        self.blue = blue
    }
}

protocol ColorGeneratorProtocol {
    var alpha: Double { get set }
    var colorCodes: [Double] { get }
    func createColorv() -> UIColor
    init(alpha: Double)
}

class ColorGenerator: ColorGeneratorProtocol {
    var alpha: Double
    var colorCodes: [ Double ] = [0, 51, 102, 153, 204, 255]
    let whireColor: UIColor = .white
    required init(alpha: Double) {
        self.alpha = alpha
    }

    func changeColorCodes(completion: ([Double]) -> Void) {
        completion([])

    }

    func changeColor(completion: () -> [Double]) {
        print(completion())
    }

    func test() {
        changeColorCodes { [weak self] newColorCodes in
            self?.colorCodes = newColorCodes
        }

        changeColor { [weak self] in
            guard let self = self else {
                return []
            }
            self.colorCodes = [0001, 0011, 0101, 1111]
            return self.colorCodes
        }
    }

    func convertToArray<T>(element: T) -> [T] {
        [element]
    }

    func printAlpha<Generator>(generator: Generator) where Generator: ColorGeneratorProtocol {
        print(generator.alpha)
    }

    func printAlphaSecond<T: ColorGeneratorProtocol>(generator: T) {
        print(generator.alpha)
    }

    func printAnyAlpha(generator: Any) {
        let gen = generator as? ColorGeneratorProtocol

        guard let generator = generator as? ColorGeneratorProtocol else {return}
        print(generator.alpha)
    }

}

enum Brightness: Double {
    case dim = 0.1
    case average = 0.5
    case bright = 1
    func description() -> String {
        switch self {
        case .dim: return "Тусклый"
        case .average: return "Средний"
        case .bright: return "Яркий"
        }
    }
}
extension ColorGeneratorProtocol {
    func createColorv() -> UIColor {
        UIColor(white: 1, alpha: alpha)
    }
}

class Paletta<CustomColor> {
    let colors: [CustomColor]

    init(colors: [CustomColor]) {
        self.colors = colors
    }

}



