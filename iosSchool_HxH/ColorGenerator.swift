import Foundation

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

class ColorGenerator {
    var alpha: Double
    var colorCodes: [ Double ] = [0, 51, 102, 153, 204, 255]
    init(alpha: Double) {
        self.alpha = alpha
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
