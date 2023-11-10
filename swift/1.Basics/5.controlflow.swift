let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Helloo, \(name)")
}

let numberOfLegs = ["Spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 0...5 {
    print("Index \(index)")
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    print("\(tickMark) ")
}

for tickMark in stride(from: 0, to: minutes, by: 5) {
    print("\(tickMark)")
}

let hours = 12
let hourInterval = 3

for tickMark in stride(from: 3, to: hours, by: 3) {
    print("\(tickMark)")
}

for tickMark in stride(from: 3, through: hours, by: 3) { // Closed Ranges 
    print("\(tickMark)")
}

/*
    while
    repeat - while
*/

/* if else if */

/* In Beta */

// let experience = 4

// let status = if experience < 1 {
//     "Fresher"
// } else if experience < 2 {
//     "Beginner"
// } else {
//     "Experienced"
// }


// let c: Character = "a"

// let message = switch ch {
//     case "a":
//         "Fresher"
//     case "b":
//         "Beginner"
//     default:
//         "Experienced"
// }

let ch: Character = "a"

switch ch {
    case"a", "A":
        print("The letter A")
    default:
        print("Nothe the letter A")

}

let approximateCount = 62
var naturalCount: String

switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    default:
        naturalCount = "many"
}

print(naturalCount);

let somePoint = (1, 1)

switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
}

let anotherPoint = (2, 0)

switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with an y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x) and \(y))")
}

let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}

let someCharacter: Character = "e"

switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) isn't a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)

switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
}

/*
    Control Transfer Statements

    continue
    break
    fallthrough

*/

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer"
}

print(description)

/* --------- Labeled statements --------- */

var val2 = 1;

outerLoop: while true {
    var val1 = 1;
    innerLoop: while true {
        if(val2 == 5) {
            break outerLoop
        }
        print(val1)
        val1+=1;
        if(val1 == 6) {
            break innerLoop
        }
    }
    val2+=1;
}

/* --------- Guard --------- */

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello, \(name)")

    guard let location = person["location"] else {
        print("Hope the weather is nice near you")
        return
    }

    print("Hope the weather is nice in \(location)")
}

greet(person: ["name": "Gopendra"])
greet(person: ["name": "Gopendra", "location": "Jaipur"])

var score = 0

if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}

// defer statement is not executed in case of run time error but executedd in case of thrown error by code itself

/* ---------- Check API Availability ---------- */

if #available(iOS 10, macOS 10.12, *) {
    // statement
} else {
    // statement
}

@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

if #available(iOS 10, *) {

} else {
    // Fallback code
}

if #unavailable(macOS 10) {
    // Fallback code
}