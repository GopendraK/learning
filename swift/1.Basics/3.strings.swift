let quotation = """
    This is a \"""
    multiline \"\"\"
    This is a \
    multiline \
    string
    """

print(quotation)

print("\u{1F496}")

print(#"Line 1\#nLine 2"#)
print(##"Line 1\##nLine 2"##)
print(#"""
Multiline """\# 
string
"""#)

// Empty String

// var str1: Character = ""
// str1.append(" Hey") // Not allowed
// print(str1)

var str1 = ""
str1.append(" Hey")
print(str1)

var str2 = String()

print(str1.isEmpty, str2.isEmpty)

for character in "Dog!" {
    print(character)
}


let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
print(greeting[greeting.index(before: greeting.endIndex)])
print(greeting[greeting.index(after: greeting.startIndex)])
print(greeting[greeting.index(greeting.startIndex, offsetBy:7)])

/* Important ----- */

// greeting[greeting.endIndex] // Gives Error

var welcome = "hello ";
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
print(welcome)