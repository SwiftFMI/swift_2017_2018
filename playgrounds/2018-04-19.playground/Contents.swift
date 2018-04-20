//(1+10)
//
//    +
//1       10
//
//израз := (израз оп израз)
//израз := число


protocol Equation {
    func eval() -> Double
}

struct Number {
    var rawText:String = ""
    init(value:Double) {
        rawText = "\(value)"
    }
}

extension Number: Equation {
    func eval() -> Double {
        return Double(rawText) ?? 0
    }
}

struct ComplexEquation {
    var left: Equation
    var right: Equation
    var op: String = "+"
}

extension ComplexEquation: Equation {
    func eval() -> Double {
        switch op {
        case "+":
            return left.eval() + right.eval()
        case "*":
            return left.eval() * right.eval()
        case "-":
            return left.eval() - right.eval()
        case "/":
            return left.eval() / right.eval()
//        case "^":
            //            return pow(left.eval(), at: right.eval())
            
        default:
            break
        }
        return 0
    }
}


//func pow(_ x:Double, at: Double) -> Double {
//    return 0
//}

extension Character {
    var isDigit:Bool {
        return self >= "0" && self <= "9"
    }
    
    var val:Double {
        return Double(String(self)) ?? 0
    }
}

let clP:(inout String) -> Equation = { eq in
    return Number(value: 5)
}

func parse(equation: inout String) -> Equation {
    
    let first = equation.removeFirst()

    if first == "(" {
        let eqLeft = parse(equation: &equation)
        let op = equation.removeFirst()
        let eqRight = parse(equation: &equation)
        equation.removeFirst()
        return ComplexEquation(left: eqLeft, right: eqRight, op: String(op))
    } else {
        
        var x = first.val
        
        repeat {
            if let f = equation.first {
                if f.isDigit {
                    x = x * 10 + f.val
                    equation.removeFirst()
                } else {
                    break
                }
            }
        } while(!equation.isEmpty)
        
        
        return Number(value: x)
    }

}

/**
 * Решение на задача 2 от домашно №1
 **/
func hw1task2solution(equation: inout String) -> Double {
    
    func eval(left:Double, right:Double, op:String) -> Double {
        switch op {
        case "+":
            return left + right
        case "*":
            return left * right
        case "-":
            return left - right
        case "/":
            return left / right
            //        case "^":
            //            return pow(left, at: right)
            
        default:
            break
        }
        return 0
    }
    
    let first = equation.removeFirst()
    
    if first == "(" {
        let eqLeft = hw1task2solution(equation: &equation)
        let op = equation.removeFirst()
        let eqRight = hw1task2solution(equation: &equation)
        equation.removeFirst()
        return eval(left: eqLeft, right: eqRight, op: String(op))
    } else {
        // това може да се отдели в отделна помощна функция за прегледност
        var x = first.val
        repeat {
            if let f = equation.first {
                if f.isDigit {
                    x = x * 10 + f.val
                    equation.removeFirst()
                } else {
                    break
                }
            }
        } while(!equation.isEmpty)
        
        return x
    }
}
var testStr = "(1024+((6+4)*(1+1)))"
//print(hw1task2solution(equation: &testStr))
print(parse(equation: &testStr).eval())

    

