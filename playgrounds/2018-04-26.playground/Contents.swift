//: Closures

func sum(a:Int, b:Int) -> Int {
    return a + b
}

//var op: (Int, Int)-> Int = sum(a:b:)


var op = { (a, b) -> Int in
    return a * b
}

//op = {
//    return $0 * $1
//}



let five = 5
let four = 4

let ourSum = op(five, four)

print(ourSum)

//: escaping closure
func generator(a:Int,  modifier: @escaping (Int)->Int ) -> () -> Int {
    
    var start = a
    
    return {
        start = modifier(start)
        return start
    }
}

let gen = generator(a: 1) { return $0 + 2 }

//let gen = generator(a: 1, modifier: { return $0 + 2 })

print(gen())
print(gen())
print(gen())
print(gen())


//: capture list


var x = 7
//()->()
let printMeNoCaptureList: ()->Void = {
    print("Value: \(x)")
}

let printMeCaptureList: ()->Void = { [x] in
    print("Value: \(x)")
}

x = 10


printMeNoCaptureList()
printMeCaptureList()


//: auto-closure

var functionsToExecute = [()->()]()

func autoClosure(f: @autoclosure @escaping ()->() ){
    //do something else
    functionsToExecute.append(f)
}

func autoClosure2(f: @escaping ()->() ) {
    //do something else
    functionsToExecute.append(f)
}

print("Оценява се на момента")
autoClosure2() { print("Оценява се 'някога' на момента - v.2")}
autoClosure(f:print("Оценява се 'някога' на момента"))

for f in functionsToExecute {
    f()
}


