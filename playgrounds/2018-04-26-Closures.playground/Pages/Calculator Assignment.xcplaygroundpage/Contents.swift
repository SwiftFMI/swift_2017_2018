//: Задача - Да имплементираме Калкулатор с унарни (√, ±) и бинарни (+,-,*,/,^) операции

struct Calculator {
    
    // Дефинираме операциите чрез клоужъри
    
    // Изброен тип (enum) от операции
    // Краен брой поддържани операции в Dictionary
    
    private var next: Double?
    
    // Чакаща бинарна операция с клоужър и първи операнд
    // Изпълнение на бинарната операция
    
    var operand: Double {
        set {
            next = newValue
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
        //switch operation
        // unary: if next, next = f(next)
        // binary: if next, създаваме чакаща операция с клоужъра и next
    }
}

