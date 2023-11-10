// Array, Set, Dictionary are mutable in swift but immutable if assigned to a constant

/* ----------- Arrays ----------- */

var arr = Array<Int>()
print(arr)

var someInts: [Int] = []

print("someInts count: \(someInts.count)")

var threeDoubles = Array(repeating: 0.0, count:3)
var fourInts = [Int](repeating: 0, count:4)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles;

print(sixDoubles)

// var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]

print(shoppingList.isEmpty)

shoppingList.append("Bread")

print(shoppingList)

shoppingList += ["Chocolate", "Cheese", "Butter"]

print(shoppingList)

var firstItem = shoppingList[0]

print(firstItem)

shoppingList[0] = "Six eggs"

// shoppingList[shoppingList.count] = "Salt" // Runtime error

shoppingList[2...4] = ["Bananas", "Apples"]

print(shoppingList)

shoppingList.insert("Maple Syrup", at: 0)

print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)

print(shoppingList)

let lastItem = shoppingList.removeLast();

print(lastItem)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

/* ------------ Sets -------------- */

var letters = Set<Character>()

letters.insert("a")

letters = [] // letters is still a set

// var favoriteGenres: Set<String> = ["Rock", "Classical", "Pop"]
var favoriteGenres: Set = ["Rock", "Classical", "Pop"] // Type inference

print("Favorite Genres count : \(favoriteGenres.count)")

print("Is empty : \(favoriteGenres.isEmpty)")

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

if (favoriteGenres.contains("Funk")) {
    print("Funk present")
} else {
    print("Funk absent")
}

for genre in favoriteGenres {
    print("Genre: \(genre)")
}


/*
    Fundamental Set Operations

    a.intersection(b)
    a.symmetricDifference(b)
    a.union(b)
    a.subtracting(b)

    a == b

    a.isSubset(of: b)
    a.isSuperset(of: b)
    a.isStrictSubset(of: b)
    a.isStrictSuperset(of: b)
    a.isDisjoint(with: b)
*/


/* ----------- Dictionaries ----------- */

var dictionary1 = Dictionary<String, String>()

print(dictionary1)

var dictionary2 = ["Python": "Machine Learning"]

print(dictionary2)

var dictionary3: [String: String] = [:]

print(dictionary3)

dictionary3["Swift"] = "IOS Development"

print(dictionary3)

var dictionary4 = ["Javascript": "Every domain"]
dictionary4["Java"] = "Android Development"
dictionary4["Java"] = "Android and Backend Development"

dictionary4.updateValue("Predominantly web development", forKey: "Javascript")

let prevValue = dictionary4.updateValue("Subset of Typescript", forKey: "Javascript")

if let prevValue {
    print("Value before update: \(prevValue)")
} else {
    print("Value didn't exist before update")
}

print("Dictionary 4 count : \(dictionary4.count)")
print("Dictionary 4 isEmpty : \(dictionary4.isEmpty)")

if let domain = dictionary4["Javascript"] {
    print("Language: Javascript - \(domain)")
} else {
    print("No domain defined for language Javascript")
}

dictionary4["Javascript"] = nil

if let domain = dictionary4.removeValue(forKey: "Javascript") {
    print("Remove domain for language Javascript: \(domain)")
} else {
    print("No domain found for language Javascript")
}

for (language, domain) in dictionary4 {
    print("Language: \(language) -> Domain: \(domain)")
}

for language in dictionary4.keys {
    print("Language: \(language)")
}

for domain in dictionary4.values {
    print("Domain: \(domain)")
}

// let languages = Array<String>(dictionary4.values)
let languages = [String](dictionary4.values)

print(languages, type(of: languages))