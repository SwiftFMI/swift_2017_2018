//: Generics - Шаблони или общ вид
//събиране на числа
func sum(_ a:Int, _ b:Int) -> Int {
    return a + b
}
//събиране на символни низове (сливане)
func sum(_ a:String, _ b:String) -> String {
    return a + b
}
//употреба на функциите.
//: Note: Когато имаме еднаква функция с различни типове параметри
//: тогава говорим за overloading.
var x = sum(1, 5)
var hw = sum("Hello", " world!")

//протокол
protocol Summable {
    //Self може да се изпозлва само когато става дума за протоколи
    static func + (left: Self, right:Self) -> Self
}
//: Шаблонни функции
func sumT<T:Summable> (a:T, b:T) -> T {
    //+ е дефиниран за Summable
    return a + b
}
//имплементираме протокола. Всички негови функции са имплемнтирани вече
extension Int: Summable {

}
//извикване на конкретната имплементация
var xT = sumT(a:1, b: 5)
//имплементираме протокола. Всички негови функции са имплемнтирани вече
extension String :Summable {

}
var hwT = sumT(a: "Hello", b: " world!")

//: Общ вид на клас
class List<T> {
    var value: T
    var next: List<T>?
    
    init(data:T) {
        self.value = data
    }
}
//изпозлване на конкретни видове
var l = List(data: 5)
var ls = List(data: "Hello world!")

//протокол
protocol CollectionEquatable {
    associatedtype Element
    var count:Int { get }
    subscript (i:Int) -> Element {get}
}
//шабнонна опашка. Общ вид
class Queue<Item> {
    //изпозлва масив за вътрешната презентация
    private var items:[Item]
    
    init() {
        items = []
    }
    //вмъкване на елемент
    func insert(item:Item) {
        items.append(item)
    }
    //вземаме на първия елемент и премахването му от опашката
    func get() -> Item? {
        if items.count > 0 {
            return items.removeFirst()
        }
        
        return nil
    }
    
}
//имплемнтация на интерфейса
extension Queue : CollectionEquatable {
    subscript (i:Int) -> Item {
        return items[i]
    }
    
    var count:Int {
        return items.count
    }
}

//Шаблонна фунцкия, която сравнява две колекции, които са CollectionEquatable
//: 1. Трябва да имаме два типа U & T за да можем да изпозлваме функцията с разлини типове
//: 2. Трябва да искаме лементите на двете колекции да са от един и същи тип  `U.Element == T.Element`
//: 3. Трябва да искаме двата елемента да са сравними `Equatable`
func isEqual<T:CollectionEquatable, U:CollectionEquatable> (a: T, b:U) -> Bool
where T.Element:Equatable, U.Element == T.Element {
    
    if a.count == b.count {
        for i in 0..<a.count {
            if a[i] != b[i] {
                return false
            }
        }
        return true
    }
    //TODO: implement
    return false
}

var arr = [1,2,3]
var queue = Queue<Int>()
queue.insert(item: 1)
queue.insert(item: 2)
queue.insert(item: 4)
extension Array: CollectionEquatable {
    
}
isEqual(a: arr, b: queue)











