let (x, y) = (1,2)

/*

if x = y {
  // This isn't valid  
}

*/

print("Hello " + "World")

print(9 % 4)
print(-9 % 4)
print(9 % -4)
print(-9 % -4)

var a = 4
// let b = a += 2 // a += 2 doesn't return anything

// print(b)

// swift has === and !==

print((1, "apple") < (2, "zebra"))

// The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare tuples with seven or more elements, you must implement the comparison operators yourself.

func getNewId() -> String {
    return "\(Int.random(in: 0..<1000))";
}

var id: String? // id defaults to nil
let currentId = id ?? getNewId()

print(currentId)

// Range operators

for index in 1...5 {
    print("Index \(index)")
}

for index in 5...5 {
    print("Index \(index)")
}

for index in 1..<5 {
    print("Index \(index)")
}

for index in 5..<5 {
    print("Index \(index)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

print(type(of:1...5))

let range = ...5

print(range.contains(-1))
print(range.contains(7))
print(range.contains(4))