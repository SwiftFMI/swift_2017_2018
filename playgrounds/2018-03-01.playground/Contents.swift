//: Playground - noun: a place where people can play

//var str = "Hello world!"

var str:String = "Hello world!"

//var str2:String = "Hello world!"

//str = "Hey!"
let f = false
var myNumber = 3.0
var b = 7.0

var typeOfA = type(of: myNumber)

var c = myNumber + b


let променлива = "abv"

var tuple = (id: 5, name: "Abv")

print(tuple.1)
tuple.0 = 7
print(tuple.id)


let array:[Int] = [1, 2, 3, 4]

var arrayT:[(Int, String)] = []

arrayT.append(tuple)

print("Брой елементи: \(array.count)")
print("Брой елементи: \(arrayT.count)")

let `if` = 5 // NOT COOL!!!

if array.count > 0 {
//    print("Имаме елементи")
}

//Dictionary

var dict = [3:"три",5:"пет"]

print(dict[3])

if let myValue = dict[3] {
    print(myValue)
} else {
    
}



//Optional

var optionalString:String? = nil //"hello world2!"

//print(optionalString ?? "няма стойност")

//print(optionalString!) - NOT COOL!!!
if let unwrappedValue = optionalString {
    print(unwrappedValue)
}


