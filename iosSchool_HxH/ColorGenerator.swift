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