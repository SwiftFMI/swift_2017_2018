import Foundation

struct Calculator {
    typealias UnaryClosure = (Double) -> Double
    typealias BinaryClosure = (Double,Double) -> Double
    
    private enum Operation {
        case unary(UnaryClosure)
        case binary(BinaryClosure)
    }
    
    private static let sqrtOp: (Double) -> Double = { operand in
        return sqrt(operand)
    }
    
    private static let invertOp: (Double) -> Double = { operand in
        return -operand
    }
    
    private static let multiplyOp: (Double, Double) -> Double = { left, right in
        return left * right
    }
    
    private static let divideOp: (Double, Double) -> Double = { left, right in
        return left / right
    }
    
    private static let addOp: (Double, Double) -> Double = { left, right in
        return left + right
    }
    
    private static let substractOp: (Double, Double) -> Double = { left, right in
        return left - right
    }
    
    private static let powOp: (Double, Double) -> Double = { left, right in
        return pow(left, right)
    }
    
    private var operations: Dictionary<String, Operation> = [
        "√" : Operation.unary(sqrtOp),
        "±" : Operation.unary(invertOp),
        "*" : Operation.binary(multiplyOp),
        "/" : Operation.binary(divideOp),
        "+" : Operation.binary(addOp),
        "−" : Operation.binary(substractOp),
        "^" : Operation.binary(powOp)
    ]
    
    private var next: Double?
    private var pending: BinaryOperation?
    
    private struct BinaryOperation {
        let firstOperand: Double
        let function: BinaryClosure
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        guard let pending = pending, let next = next else { return }
        
        self.next = pending.perform(with: next)
        self.pending = nil
    }
    
    var operand: Double? {
        set {
            // Clear
            guard let new = newValue else {
                next = nil
                pending = nil
                return
            }
            
            next = newValue
            performPendingBinaryOperation()
        }
        get {
            return next ?? 0
        }
    }
    
    var result: Double? {
        get {
            return next
        }
    }
    
    mutating func perform(_ symbol: String) {
        if let op = operations[symbol] {
            switch op {
            case .unary(let f):
                if next != nil {
                    next = f(next!)
                }
            case .binary(let f):
                if next != nil {
                    pending = BinaryOperation(firstOperand: next!, function: f)
                    next = nil
                }
            }
        }
    }
}

var calculator = Calculator()

calculator.operand = 3
calculator.result

calculator.perform("*")
calculator.result

calculator.operand = 2
calculator.result

calculator.perform("^")
calculator.result

calculator.operand = 2
calculator.result

calculator.perform("√")
calculator.result

