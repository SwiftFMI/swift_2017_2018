// Bool
let yes: Bool = true
let no = false

// if
if yes {
    "Изразът е верен, защото yes е true"
}
// if-else
if no {
    
} else {
    "Изразът не е верен, защото no e false"
}

// Операции с bool
// ==, !=, <, >, <=, >=, &&, ||

if no && yes {
    
} else {
    "Изразът не е верен, защото no е falsе, yes няма и да се провери дали е вярно"
}

if yes || no {
    "Изразът е верен, защото yes е true, no няма и да се провери дали е грешно"
}

// Тернарен оператор
let a = 1
let b = 3

let min = a < b ? a : b
let max = a > b ? a : b

// if-else if
let hour = 12
let time: String

if hour < 6 {
    time = "Рано сутрин"
} else if hour < 12 {
    time = "Сутрин"
} else if hour < 17 {
    time = "Следобед"
} else if hour < 20 {
    time = "Вечер"
} else if hour < 24 {
    time = "Късно вечер"
} else {
    time = "Невалиден час"
}

// switch
let time2: String

switch hour {
case 0, 1, 2, 3, 4, 5: // Хамалогия
    time2 = "Рано сутрин"
case 6, 7, 8, 9, 10, 11:
    time2 = "Сутрин"
case 12, 13, 14, 15, 16:
    time2 = "Следобед"
case 17, 18, 19:
    time2 = "Вечер"
case 20, 21, 22, 23:
    time2 = "Късно вечер"
default:
    time2 = "Невалиден час"
}

// switch+range
let time3: String

switch hour {
case 0..<6: // Хамалогия
    time3 = "Рано сутрин"
case 6..<12:
    time3 = "Сутрин"
case 12..<17:
    time3 = "Следобед"
case 17..<20:
    time3 = "Вечер"
case 20..<24:
    time3 = "Късно вечер"
default:
    time3 = "Невалиден час"
}

// switch+where (pattern matching)
let num = 10

switch num {
case let x where x % 2 == 0:
    print("\(x) е Четно")
default:
    print("\(num) е Нечетно")
}


