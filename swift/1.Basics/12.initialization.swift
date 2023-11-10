/*
    When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.
*/

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")