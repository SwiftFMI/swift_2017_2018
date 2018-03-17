//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"

//
func swap(a:inout Int, b: inout Int) -> () {
    let c = a
    a = b
    b = c
}

func swap(_ a:inout Int,_ b: inout Int) -> () {
    let c = a
    a = b
    b = c
}


func swapResult(a: Int, b:Int) -> (Int, Int) {
    return (b, a)
}


var a = 5
var b = 7

print("a=\(a)")
print("b=\(b)")

//let tupleR = swapResult(a: a, b: b)
//a = tupleR.0
//b = tupleR.1

swap(a: &a, b: &b)
swap(&a, &b)
print("a=\(a)")
print("b=\(b)")



let helloWorld = "Hello 🌍!"
// синтаксиса ?? се оценява, с дясната стойност на израза, само ако първата част е nil. За повече информация виж частта за Optionals
//utf-8
print(Unicode.Scalar(helloWorld.utf8.dropFirst(0).first!))//H
print(helloWorld.utf8.dropFirst(6).first!)//част от емоджито
print(helloWorld.utf8.dropFirst(7).first!)//част от емоджито
print(helloWorld.utf8.dropFirst(8).first!)//част от емоджито
print(helloWorld.utf8.dropFirst(9).first!)//част от емоджито
print(Unicode.Scalar(helloWorld.utf8.dropFirst(10).first!)) //!

//utf-16
print(helloWorld.utf16.dropFirst(6).first!)
print(helloWorld.utf16.dropFirst(7).first!)
print(helloWorld.utf16.dropFirst(8))//!

//utf-32
print(helloWorld.unicodeScalars.dropFirst(6).first!)//емоджи
print(helloWorld.unicodeScalars.dropFirst(7))//!


