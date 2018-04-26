//MARK: Рекурсия
func factorial(N n: Int) -> Int {
    if n == 1 || n == 0 {
        return 1
    } else {
        return n*factorial(N: n-1)
    }
}

factorial(N: 7)

postfix operator ¡
postfix func ¡(number: Int) -> Int {
    return factorial(N: number)
}

5¡
