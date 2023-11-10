enum CompassPoint {
    case east
    case north
    case west
    case south
}

// enum CompassPoint {
//     case east, north, west, south
// }

var directionToHead = CompassPoint.east

directionToHead = .west

print(directionToHead)

switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case.east:
        print("Where the sun rises")
    // case.west:
    //     print("Where the skies are blue")
    default:
        print("No case matched")
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

print(type(of: Beverage.allCases))

let numberOfChoices = Beverage.allCases.count

print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

/* Enumeration associated value */

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = Barcode.upc(8, 85909, 51226, 3)

// switch productBarCode {
//     case .upc(let numberSystem, let manufacturer, let product, let check):
//         print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//     case .qrCode(let productCode):
//         print("QR Code: \(productCode)")
// }

switch productBarCode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR Code: \(productCode)")
}

/* Enunmeration prepopulated value */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

func scope1() {

    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }

    enum CompassPoint: String {
        case north, south, west, east
    }

    let earthsOrder = Planet.earth.rawValue
    let sunsetDirection = CompassPoint.west.rawValue

    print("Earth's order: \(earthsOrder)")
    print("Sunset Direction: \(sunsetDirection)")

    let possiblePlanet = Planet(rawValue: 7)

    print(possiblePlanet!)

    let positionToFind = 11

    if let planet = Planet(rawValue: positionToFind) {
        switch planet {
            case .earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for human")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
}

scope1()


/* --------- Recursive Enumerations --------- */

// enum ArithmeticExpression {
//     case number(Int)
//     indirect case addition(ArithmeticExpression, ArithmeticExpression)
//     indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
// }

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression {
        case let .number(a):
            return a
        case let .addition(a, b):
            return evaluate(a) + evaluate(b)
        case let .multiplication(a, b):
            return evaluate(a) * evaluate(b)
    }
}

print(evaluate(product))