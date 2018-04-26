//MARK: Променлив брой параметри (Variadic)
// 1.
// func greet people with array (print "welcome" joined by ", ")
// call greet

// 2.
// func greet with var params ...
// call greet

func greet(people: [String]) {
    let greeted = people.joined(separator: ", ")
    print("Здравейте \(greeted)")
}

greet(people: ["Иван", "Георги", "Мая"])
