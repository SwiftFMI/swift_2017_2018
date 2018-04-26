//MARK: Функция с параметър други функции
// define func order(inout [Int], func: CompareFunc)
// bubble sort for _ in 0...count { for current in 1...count -1 {if CompareFunc swap current-1(tmp = prev) with current } }
// typealias?
// define compare func (Int, Int) -> Bool

var arr = [2,5,7,3,1,34,5,4,1,8,2]

func compare(left: Int, right: Int) -> Bool {
    return left < right
}

typealias Comparator = (Int, Int) -> Bool
func order(array: inout [Int], comparator: Comparator) {
    
    for _ in array {
        for currentIndex in 1...array.count-1 {
            let previousIndex = currentIndex - 1
            if comparator(array[currentIndex], array[previousIndex]) {
                let temp = array[previousIndex]
                array[previousIndex] = array[currentIndex]
                array[currentIndex] = temp
            }
        }
    }
}

let compareFunc: Comparator = compare
order(array: &arr, comparator: compareFunc)
