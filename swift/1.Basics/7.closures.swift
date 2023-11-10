let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func desc(c: String, d: String) -> Bool {
    return c > d
}

let sorted = names.sorted(by: desc)

// var reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
//     return s1 > s2
// })

// var reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// var reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// var reversedNames = names.sorted(by: { $0 > $1 })

var reversedNames = names.sorted(by: >)

reversedNames = names.sorted() { $0 < $1 }

reversedNames = names.sorted { $0 < $1 }

print(reversedNames)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let answer = numbers.map {
    var val = $0
    var result = ""
    while(val > 0) {
        let digit = val % 10
        result = digitNames[digit]! + result;
        val = val / 10
    }

    return result
}

print(answer)

func canTakeCoffee(_ age: Int, onSuccess: (String) -> Void, onFailure failHandler: (String) -> Void) -> Void {
    guard age > 0 else {
        failHandler("Invalid age")
        return
    }
    if(age < 10) {
        failHandler("You are not allowed to take coffee")
    } else {
        onSuccess("You are allowed to take coffee")
    }
}

canTakeCoffee(8) {
    print($0)
} onFailure : {
    print($0)
}

/* ------------ Capturing values ------------- */

func makeIncrementor(amount: Int) -> () -> Int {
    var counter = 0
    func incrementor() -> Int {
        counter += amount
        return counter
    }

    return incrementor
}

let incrementByTwo = makeIncrementor(amount: 2)
incrementByTwo()
incrementByTwo()
incrementByTwo()
incrementByTwo()

print(incrementByTwo())

var customersInLine = ["Alex", "John", "Dave", "David"]

let customerRemover = { customersInLine.remove(at: 0)}

/* --------- excaping closure - done --------- */

/* --------- autoclosure --------- */

// func removeCustomer(customerRemover: () -> String) {
//     print("Rmoved customer: \(customerRemover())")
// }

// removeCustomer(customerRemover: customerRemover)

// func removeCustomer(customerRemover: () -> String) {
//     print("Rmoved customer: \(customerRemover())")
// }

// removeCustomer(customerRemover: {customersInLine.remove(at: 0)})

func removeCustomer(customerRemover: @autoclosure () -> String) {
    print("Rmoved customer: \(customerRemover())")
}

removeCustomer(customerRemover: customersInLine.remove(at: 0))