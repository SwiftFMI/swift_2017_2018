extension Int {
    static var favoriteNumber: Int {
        return 23
    }
}

print(Int.favoriteNumber)

extension Int {
    func squared() -> Int {
        return self * self
    }
}

print(2.squared())
print(3.squared())


class Person {
    let firstName: String
    var lastName: String
    var age: Int
    var phoneNumber: String
    
    init(firstName: String, lastName: String, age: Int, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.phoneNumber = phoneNumber
    }
}

extension Person {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

extension Person {
    func growOlder() {
        age += 1
    }
    
    func greet() {
        print("Hello, my name is \(fullName). I'm \(age).")
    }
}

let harry1 = Person(firstName: "Harry", lastName: "Potter", age: 12, phoneNumber: "unknown")

harry1.greet()
harry1.growOlder()
harry1.greet()

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.age == rhs.age && lhs.phoneNumber == rhs.phoneNumber
    }
}

let harry2 = Person(firstName: "Harry", lastName: "Potter", age: 17, phoneNumber: "unknown")

print(harry1 == harry2)

extension FloatingPoint {
    var asRadians: Self { return self * .pi / 180 }
    var asDegrees: Self { return self * 180 / .pi }
}

let f = Float(45)
print(f.asRadians)

let d = Double(45)
let f80 = Float80(45)
print(d.asRadians)
print(f80.asRadians)
