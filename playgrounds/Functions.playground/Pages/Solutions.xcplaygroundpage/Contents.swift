import Foundation

func simple() {
    print("Hello World!")
}

simple()

func count(from: Int, to: Int) {
    for i in from...to {
        print(i)
    }
}

//count(from: 1, to: 10)

//MARK: Параметри със стойност по подразбиране

func countDown(from: Int, to: Int = 1) {
    for i in (to...from).reversed() {
        print(i)
        sleep(1)
    }
}

//countDown(from: 10)

//MARK: Променлив брой параметри (Variadic)
func greet(people: String...) -> String {
    let names = people.joined(separator: ", ")
    return "Добре дошли \(names)."
}

//greet(people: "Иван", "Георги", "Мая")

//MARK: inout параметри
func double(_ number: inout Int) {
    number = number * 2
}

var n = 2
double(&n) // Обърнете внимание на "&"
//print(n)

//MARK: Вложени функции
func fancyIncrement(number: Int) {
    func actualIncrement(_ number: Int) -> Int {
        return number + 4
    }
    
    let incremented = actualIncrement(number)
    print(incremented)
}

//fancyIncrement(number: 4)

//MARK: Функция с параметър други функции
typealias Comparator = (Int, Int) -> Bool
func order(_ array: inout [Int], function: Comparator) {
    // Bubble sort
    for _ in array {
        for current in 1...array.count-1 {
            let prev = current - 1
            if function(array[prev],array[current]) {
                let temp = array[prev]
                array[prev] = array[current]
                array[current] = temp
            }
        }
    }
}

func compare(left: Int, right: Int) -> Bool {
    return left > right
}

var arr = [2,5,7,3,1,34,5,4,1,8,2]
order(&arr, function: compare(left:right:))


//MARK: Функции като променливи
func myLog(_ number: String) {
    print(number)
}

let logger = myLog
logger("Функция като променлива!")

//MARK: Функции, които връщат други функции
func createPrinter() -> (String) -> String {
    var counter = 0
    
    func printer(_ string: String) -> String {
        print(string)
        counter += 1
        
        print("\(counter) " + (counter > 1 ? "принтирания" : "принтиране"))
        return string
    }
    
    return printer
}

let myPrinter = createPrinter()
myPrinter("Яко!")
myPrinter("Супер!")
myPrinter("О, да!")

// Обърнете внимание на counter - нараства с всяко извикване (closure??)!

//MARK: Предефиниране на оператори (overloading)
typealias Vector = (x: Int, y: Int)

func +(left: Vector, right: Vector) -> Vector {
    return (left.x + right.x, left.y + right.y)
}

let vA: Vector = (x: 3, y: 1)
let vB: Vector = (x: 0, y: 2)

let vC = vA+vB

// Видове оператори:
// Бинарни
// infix - между две стойности (например 2 + 2)
// Унарни
// prefix - преди стойността (например знакът за отрицателно число -2)
// postfix - след стойността (например операторът ? или !, с които разопаковаме Optinals)
// Тернарни
// ternary - два символа между три стойности. Не са позволени във Swift. Изключение прави x ? y : z (съкратен if-else)

prefix func -(vector: Vector) -> Vector{
    return (-vector.x, -vector.y)
}

//-vA // Има дефект в Swift, докладван с https://bugs.swift.org/browse/SR-294 очакван резултат (x -3, y -1)

func *(left: Int, right: Vector) -> Vector {
    return (left*right.x,left*right.y)
}

3 * vA

func *(left: Vector, right: Int) -> Vector {
    return right*left
}

vB * 3

//MARK: Рекурсия
func factorial(N n: Int) -> Int {
    if n == 1 || n == 0 {
        return 1
    } else {
        return n*factorial(N: n-1)
    }
}

factorial(N: 7)
