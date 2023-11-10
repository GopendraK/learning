func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

// Return special value Void
func greet2(person: String) {
    print("Hello, \(person)")
}

func minMax(_ array: [Int]) -> (min: Int, max: Int)? {
    guard array.count > 0 else {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }

    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])

if let bounds {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}

print(greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}

print(anotherGreeting(for: "Dave"))

func function1 (_ a: Int..., bL b: Double..., c: String...) -> Void {
    for aN in a {
        print(aN)
    }
    for bN in b {
        print(bN)
    }
}

function1(1,2,3,4, bL: 1.1, 2.2, 3.3, c: "Gopendra", "Dave")

func swapAB(_ a: inout Int, _ b: inout Int) {
    let temp  = a;
    a = b;
    b = temp;
}

var a = 10;
var b = 20;

swapAB(&a, &b)

print(a, b)

var swapTwoNumbers: (inout Int, inout Int) -> Void = swapAB
swapTwoNumbers(&a, &b)

print(a, b)

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

func addTwoInts(a: Int, b: Int) ->Int {
    return a + b
}

printMathResult(addTwoInts, 3, 4)

func stepForward(_ step: inout Int) -> Void {
    step += 1
}

func stepBackward(_ step: inout Int) -> Void {
    step -= 1
}

func chooseStepFunc(_ isBackward: Bool) -> (inout Int) -> Void{
    return isBackward ? stepBackward : stepForward
}

var step = 10

print(chooseStepFunc(false)(&step), step)
print(chooseStepFunc(true)(&step), step)