//MARK: Вложени функции
// func simpleIncrement Int, print Int+x
// call

//func fancyIncrement(number: Int) { //use inline func "actualIncrement" }
//fancyIncrement(number: 4)

func fancyIncrement(number: Int) -> Int {
    
    func actualIncrement(_ n: Int) -> Int {
        return n + 4
    }
    
    return actualIncrement(number)
}

fancyIncrement(number: 4)
