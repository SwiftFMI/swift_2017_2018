// Затворен интервал
let closed = 0...4 // 0, 1, 2, 3, 4

// Интервал, отворен от дясно
let halfOpen = 0..<4 // 0, 1, 2, 3

// For - for <константа> in <интервал> {}
var sum = 0
let count = 15
for x in 1...count {
    sum += x
}

print(sum)

for _ in 1...3 {
    print("Итерация")
}

// Таблица за умножение
let num = 5

var table = [[Int]]()
for x in 0..<num {
    var row = [Int]()
    for y in 0..<num {
        row.append(x+1*y+1)
    }
    table.append(row)
}

print(table)

var table2 = [[Int]](repeatElement([Int](repeatElement(0, count: num)), count: num))

for x in 0..<table2.count {
    for y in 0..<table2[x].count {
        table2[x][y] = x+1*y+1
    }
}

print(table2)

// continue
var oddSum = 0
for row in 0..<table.count {
    if row % 2 == 0 {
        continue
    }
    
    for value in table[row] {
        oddSum += value
    }
}

print(oddSum)

// label
var bottomSum = 0
rowLoop: for row in 1...num {
    colLoop: for col in 1...num {
        if row == col {
            continue rowLoop
        }
        
        bottomSum += row*col
    }
}

print(bottomSum)
