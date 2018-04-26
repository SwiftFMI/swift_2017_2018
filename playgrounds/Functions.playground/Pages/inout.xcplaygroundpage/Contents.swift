//MARK: inout параметри
// 1.
//func double Int, return Int*2
// 2.
// Use inout to double inline
//pass with &

func double(_ number: inout Int) {
    number = number * 2
}

var num = 2

double(&num)
