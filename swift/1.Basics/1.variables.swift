let name = "Gopendra";
print("My name is \(name)")

// Its a comment

/*
    Its a multiline comment
*/

/*
    Parent comment

    /*
        Child Comment
    */
*/

let profile = "SD"; print(profile)

// Integer Types

/*
    UInt8 - Unsigned 8 bit integer
    Int32 - Signed 32 bit integer
*/

let minValue = UInt8.min;
let maxValue = UInt8.max;

print(minValue, maxValue)

let decimalInteger = 17
let binaryInteger = 0b111
let octalInteger = 0o21
let hexdecimalInteger = 0x11

let floatExponent = 1.25e2
let hexadecimalFloatExponent = 0x11p2

print(decimalInteger, binaryInteger, octalInteger, hexdecimalInteger, floatExponent, hexadecimalFloatExponent)

let val1 = 3.4
print(val1)
let val2 = 4 + Int(val1)
print(val2)

// let val3 = val2 + val1; // Gives error
// print(val3)

typealias AudioSample = UInt16;

let maxAmplitude = AudioSample.min;

print(maxAmplitude)

// Tuples

let http404Error = (404, "Not Found")
let (statusCoode, statusMessage) = http404Error
print("Status Code: \(statusCoode), Status Message: \(statusMessage)")
// let (statusCoode, _) = http404Error

print("Status Code: \(http404Error.0), Status Message: \(http404Error.1)")

let http200Status = (statusCode: 200, statusMessage: "OK")
print("Status Code: \(http200Status.statusCode), Status Message: \(http200Status.statusMessage)")

let numStr = "20"
let convertedNum = Int(numStr)

// if(convertedNum != nil) {
//     print("Number successfully converted: \(convertedNum!)")
// } else {
//     print("String you provided is not a valid number string.")
// }

// if let value = convertedNum {
//     print("Number successfully converted: \(value)")
// } else {
//     print("String you provided is not a valid number string.")
// }

// if let convertedNum = convertedNum {
//     print("Number successfully converted: \(convertedNum)")
// } else {
//     print("String you provided is not a valid number string.")
// }

if let convertedNum {
    print("Number successfully converted: \(convertedNum)")
} else {
    print("String you provided is not a valid number string.")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber, secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

let valQMark: String? = "QMark Value";
let valEMark: String!

// let val1n: String = valEMark
// let val2n: String = valQMark // Gives Erro

// print(val1n)
print(valEMark)

// Error Handling

func canThrowAnError() throws {
    throw "An error occurred"
}

do {
    try canThrowAnError()
} catch {
    
}