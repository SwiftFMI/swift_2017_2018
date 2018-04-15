//:Класове

class Show {
    var cast:[String]
    var duration = 0.0
    
    init(cast:[String]) {
        self.cast = cast
    }
    
    func printCast() {
        print("Show.\(#function)")
        for c in self.cast {
            print(c)
        }
    }
    
    var numberOfPeopleInvolved:Int {
        get {
            return self.cast.count
        }
    }
}

class TVShow : Show {
    var isFullHD = false
    
    var director:String = "NoName"
    
    init() {
        super.init(cast: [])
    }
    
    init(isFullHD:Bool) {
        self.isFullHD = isFullHD
        super.init(cast: [])
    }
    
    convenience init(duration:Double) {
        self.init()
        self.duration = duration
    }
    
    convenience init(duration:Double, isFullHD:Bool) {
//        self.init(isFullHD: isFullHD)
//        self.duration = duration
        
        
        self.init(duration: duration)
        self.isFullHD = isFullHD
    }
    
    override func printCast() {
        print("TVShow.\(#function)")
        print("Director: \(director)")
        super.printCast()
    }
    override var numberOfPeopleInvolved:Int {
        get {
            return super.numberOfPeopleInvolved + 1
        }
    }
}

extension Show {
    func test() -> String {
        return "test"
    }
}


let myShow:Show = TVShow()
myShow.cast = ["Бай Иван", "Попай"]

myShow.test()

let myShow2:Show = Show(cast:["Бай Иван 2", "Попай 2"])

let shows:[Show] = [myShow, myShow2]

//print("Duration: \(myShow.duration)")

//myShow.printCast()

//for s in shows {
//    s.printCast()
//    print("# \(s.numberOfPeopleInvolved)")
//    print(s.test())
//    print(type(of: s))
//}




//: ## Протоколи

protocol Printable {
   func printMe()
    var isPrintable:Bool {get set}
}

protocol Working {
    var isWorking:Bool {get}
    
}

protocol Mix: Printable, Working {
    
}

class Car: Mix {
    var speed = 100
    var isPrintable: Bool = true
    var isWorking: Bool = true
    func printMe() {
        print("Car speed is \(speed)")
    }
}

struct Bicycle: Printable {
   var speed = 10
    
}

extension Bicycle {
    func printMe() {
        print("Bicycle speed is \(speed)")
    }
    var isPrintable: Bool {
        get {
            return false
        }
        set {
            //
        }
    }
}

let p:Car = Car()
let p2 = p
p2.speed = 200
p.printMe()
let b:Bicycle = Bicycle()
//b.speed = 300
b.printMe()




