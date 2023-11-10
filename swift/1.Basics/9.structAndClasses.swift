// struct SomeStructure {

// }

class SomeClass {

}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let vga = Resolution(width: 640, height: 480)

print(vga)

// Structures and Enumerations Are Value Types

/*

    IMPORTANT:

    integers, floating-point numbers, Booleans, strings, arrays and dictionaries - are all
    value types in Swift and are implemented as structures behind the scenes.


    NOTE:

    Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification. The behavior you see in your code is always as if a copy took place immediately.

*/

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)") // north
print("The remembered direction is \(rememberedDirection)") // west


let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

struct FixedLengthRange {
    var firstValue: Int = 5
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

print(rangeOfThreeItems)

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

// rangeOfFourItems.firstValue = 6 // Gives Error

/* --------- Lazy Stored Properties ---------- */

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var dataImporter = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("Some more data")

print(manager.dataImporter.filename)

/* ----------- Computed Properties ---------- */

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

// struct Rect {
//     var origin = Point()
//     var size = Size()
//     var center: Point {
//         get {
//             let centerX = origin.x + size.width / 2
//             let centerY = origin.y + size.height / 2
//             return Point(x: centerX, y: centerY)
//         }

//         set(newCenter) {
//             origin.x = newCenter.x - size.width / 2
//             origin.y = newCenter.y - size.height / 2
//         }
//     }
// }

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        }

        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
    // var volume: Double {
    //     return width * height * depth
    // }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

print("Volume: \(fourByFiveByTwo.volume)")

class StepCounter {
    var totalSteps: Int = 0 {
        // willSet(newTotalSteps) {
        //     print("About to set totalSteps to \(newTotalSteps)")
        // }
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

/* ----------- Property Wrappers ----------- */

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = min(newValue, 12)
        }
    }
}

struct SmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()

    var height: Int {
        get {
            return _height.wrappedValue
        }
        set {
            _height.wrappedValue = newValue
        }
    }
    var width: Int {
        get {
            return _width.wrappedValue
        }
        set {
            _width.wrappedValue = newValue
        }
    }
}

// struct SmallRectangle {
//     @TwelveOrLess var height: Int
//     @TwelveOrLess var width: Int
// }

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set { 
            if newValue > maximum {
                number = maximum
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        maximum = 12
        number = 0
        projectedValue = false
    }

    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
        projectedValue = false
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        self.number = min(wrappedValue, maximum)
        projectedValue = false
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)

struct SomeStructure {
    @SmallNumber var someNumber: Int
}

var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

enum SizeEnum {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: SizeEnum) -> Bool {
        switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 100
        }
        return $height || $width
    }
}

var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: SizeEnum.small))

func someFunction() {
    @SmallNumber var myNumber: Int = 0

    myNumber = 10

    myNumber = 24

    print(myNumber)
}

someFunction()

/* --------- Type ---------- */

// struct SomeStructure {
//     static var storedTypeProperty = "Some value."
//     static var computedTypeProperty = Int {
//         return 1
//     }
// }

// enum SomeEnumeration {
//     static var storedTypeProperty = "Some value."
//     static var computedTypeProperty: Int {
//         return 6
//     }
// }

// class SomeClass {
//     static var storedTypeProperty = "Some value."
//     static var computedTypeProperty: Int {
//         return 27
//     }
//     class var overrideableComputedTypeProperty: Int {
//         return 107
//     }
// }

// print(SomeStructure.storedTypeProperty)

// SomeStructure.storedTypeProperty = "Another value"

// print(SomeStructure.storedTypeProperty)

// print(SomeEnumeration.computedTypeProperty)
// print(SomeClass.computedTypeProperty)

/* ----------- Methods ------------ */

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")


/*
    IMPORTANT:

    let fixedPoint = Point(x: 3.0, y: 3.0)
    fixedPoint.moveBy(x: 2.0, y: 3.0)

    above code will give error because mutating method can't be called on contant instance of struct

*/

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1


    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }


    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }


    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}