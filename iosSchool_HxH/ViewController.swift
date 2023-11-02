import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
        let result = arrayInt.filter { elem in
            elem % 2 == 0
        }
        print(result)

        let result1 = arrayInt.filter { $0 % 2 == 0}
        print(result1)

        let array: [Double] = [1, 2, 3, 4, 5, 6]
        let generators = array.map { ColorGenerator(alpha: $0) }
        let test = array.map { alpha -> ColorGenerator? in
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

        let test2 = test1.compactMap { $0 }
        let test3 = test1.compactMap { $0?.alpha }
        print(test1)
        print(test2)
        print(test3)

        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        let resultReducde = arr.reduce(1) { result, number in
            result * number
        }
        print(resultReducde)
    }
}
