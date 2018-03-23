//:## Въпроси от предишната лекция
//
//:Следват няколко основни въпроса, които маркират основните ключови моменти от предишната лекция.
//
//:- Какво помним за функциите в `swift`?
//:     - за имената
//:     - за параметрите
//:     - за връщаните типове
//:     - за ?
//
//:- Какви са операторите?

func sum(a:Int, b:Int) -> (Int) {
    return a + b
}

//let f = sum(a:b:)


struct Battery {
    var capacity: Int
    var charge: Int
    
    init(capacity:Int) {
        print("Създаваме нов акомулатор!")
        self.capacity = capacity
        self.charge = capacity
    }
}

struct Car {
    var color:Int = 0
    var id:String = "000000"
    var brand:String?
    var isManual = false
    var _year:Int
    
    lazy var battery:Battery = Battery(capacity: 34000)
    
    init(color myColor:Int, id: String, brand:String?, isManual:Bool, _year:Int) {
        color = myColor
        self.id = id
        self.brand = brand
        self.isManual = isManual
        self._year = _year
    }
    
    init(color myColor:Int, brand:String?) {
        color = myColor
//        self.brand = brand
        self._year = 2000
    }
    
    var isAutomatic:Bool {
        get {
            return !self.isManual
        }
    }
    
    var year: Int {
        get{
            print("Прочитаме годината на производство.")
            return _year
        }
        
        set(newValue) {
            
            print("Нова година на производство.")
           _year = newValue
        }
    }
    
    subscript (year:Int) -> String {
        
        if (year < _year) {
            
            return "Not made yet!"
        }
        
        if (year > 2017) {
            
            return "It is super new!"
        }
        
        return "It has been made!"
    }
}

extension Car {
    func printDetails() {
        print("Кола: \(brand ?? "?")")
        print("година на производство: \(self.year)")
        print(isAutomatic ? "автоматик":"ръчна скоростна кутия")
    }
}

extension Int {
//    var x:Int
    func toMyString() -> String {
        return self.toBGN
    }
    var toBGN:String {
        return "\(self) лв."
    }
}


var tesla = Car(color:0xCCCCCC, id: "123321", brand: "Tesla", isManual: false, _year:1920)

print("Car id: \(tesla.id)")


//tesla.isAutomatic = false

if tesla.isAutomatic {
    print("Колата \(tesla.brand ?? "?") е автоматик." )
}

tesla.year = 2016
print("Колата е от \(tesla.year) година.")

let year = 2017
print("Информация за \(tesla.id) - \(tesla[year]).")
print("-------------")

//let c = tesla.battery.charge
tesla.printDetails()





var a = 5
var b = a

a = 7

print("b= \(b)")

let petLeva = 5

print(petLeva.toBGN)



func fastPow(x:Int, n:Int) -> Int {
    
//    switch n {
//    case 0:
//        return 1
//    case
//    default:
//        <#code#>
//    }
    print("умножение")
    
    if n == 0 {
       return 1
    }
    
    if n % 2 == 0 {
        let y = fastPow(x: x, n: n / 2)
        return y * y
    }
    
    return x * fastPow(x: x, n: n - 1)
}

//func strLen(str:String) -> Int {
//
//    if str.isEmpty {
//        return 0
//    }
//
//    return 1 + strLen(str: String(str.dropFirst()))
//}
extension String {
    func strLen(str:String) -> Int {
        return str.isEmpty ? 0 : 1 + strLen(str: String(str.dropFirst()))
    }
}


let result = fastPow(x: 2, n: 16)

print(result.toBGN)

let str = "hi flskadjd alsld ajs adsids j"
print(str.strLen(str: str))


func findFirst(str:String , pattern:String, pos: Int) -> Int? {
    if str.isEmpty {
        return nil
    }
    
    if str.starts(with: pattern) {
        return pos
    }
    
    return findFirst(str: String(str.dropFirst()), pattern: pattern, pos: pos + 1)
}

//[1...20] != 1...20


let example = "Hello world!"
let pattern = "l"

print(findFirst(str: example, pattern: pattern, pos: 0)!)

for i in 1...10 {
    print(" ")
}




