//MARK: Функции като променливи
//func myLog(String) { }
// assign to let
// call let

//MARK: Функции, които връщат други функции
// func createP return func P
// counter increment in p
// assign let to createP result
// call let
// observe counter

func createPrinter() -> (String) -> String {
    var counter = 0
    
    func printer(string: String) -> String {
        print(string)
        counter += 1
        print("Принтирам за \(counter) път")
        return string
    }
    
    return printer
}

let myPrinter = createPrinter()

myPrinter("Тест")
myPrinter("Тест1")
myPrinter("Тест2")
myPrinter("Тест3")
myPrinter("Тест4")
