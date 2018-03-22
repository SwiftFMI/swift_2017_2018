import Foundation // Този модул ни е нужен за random функцията

// Игрална дъска
let finish = 25
var board = [Int](repeatElement(0, count: finish + 1))
// Стълбички
board[2] = 7/*2->9*/; board [6] = 8/*6->14*/; board[9] = 8/*9->17*/; board[10] = 2/*10->12*/;
// Змии
board[13] = -10/*13->3*/; board[19] = -11/*19->8*/; board[21] = -3/*21->18*/; board[24] = -8/*24->916*/;

// Игра - While
// Текущо квадратче
var current = 0

while current < finish {
    // Хвърляме зар
    let roll = Int(arc4random_uniform(6) + 1)
    // Местим със стойността на зара
    current += roll
    // Проверка за край на играта
    if current < board.count {
        // Проверяваме дали сме стъпили на змия или стълбичка и се придвижваме
        current += board[current]
    }
}

print("Game over!")

// Рестартираме играта
current = 0

// Игра - repat while
repeat {
    // Проверяваме дали сме стъпили на змия или стълбичка и се придвижваме
    current += board[current]
    // Хвърляме зар
    let roll = Int(arc4random_uniform(6) + 1)
    // Местим със стойността на зара
    current += roll
} while current < finish // Проверка за край на играта

print("Game over!")
