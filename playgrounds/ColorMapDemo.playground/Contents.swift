//: ## Въпроси от предишната лекция

//: Следват няколко основни въпроса, които маркират ключови моменти от предишната лекция.

//: - Какви са структурите?
//: - Какви видове пропъртита знаем?
//: - Какво са `init` методите?
//: - Какво е `subscript`?
//: - Как можем да променяме части от структурата?
//: - Какво е предимството на `lazy`?


//: Преброяване на цветовите фрагменти върху квадратна мрежа.

//:     $$$$$$$$$$^^^^^
//:     $$$$$оооо^^^^^^
//:     $$$$$оо^^^^хххх
//:     ххххххххххххххх
//:     ххххххххххххххх
//:
//:     отговор: 4
let EMPTY = " "
let VISITED = "x"

struct Location {
    var x = 0
    var y = 0
    
    func printMe() {
        print(" Location: \(x) \(y)")
    }
}

struct Ma3x {
    var data: [[String]]
    var width: Int
    var height: Int
    
    init(rawData:[[String]]) {
        data = rawData
        height = data.count
        if height > 0 {
            width = rawData[0].count
        } else {
            width = 0
        }
    }
    
    init(width: Int, height:Int) {
        data = []
        self.width = width
        self.height = height
        
        for _ in 0..<height {
            var row:[String] = []
            for _ in 0..<width {
                row.append(EMPTY)
            }
            data.append(row)
        }
    }
    
    var mask:Ma3x {
        return Ma3x(width: width, height: height)
    }
    
    subscript (i:Int, j:Int) -> String {
        get {
            return data[i][j]
        }
        
        mutating set {
            data[i][j] = newValue
        }
    }
    
    func neighbours(of location:Location) -> [Location] {
        var n:[Location] = []
        
        if location.x > 0 {
            n.append(Location(x: location.x - 1, y: location.y))
        }
        
        if location.y > 0 {
            n.append(Location(x: location.x, y: location.y - 1))
        }
        
        if location.x + 1 < width {
            n.append(Location(x: location.x + 1, y: location.y))
        }
        
        if location.y + 1 < height {
            n.append(Location(x: location.x, y: location.y + 1))
        }
        
        return n
    }
    
    func printMe() {
        print("Maze: \(width) x \(height):")
        for row in data {
            var line = ""
            for item in row {
                line.append(item)
            }
            print(line)
        }
    }
}


func countSegments(matrix:[[String]]) -> Int {
    
//    func markSegment(location:Location, type: String, matrix: inout Ma3x, mask: inout Ma3x) {
//
////        location.printMe()
//
//        if matrix[location.x, location.y] != type {
//          return
//        }
//        if mask[location.x, location.y].isVisited {
//            return
//        }
//        //!!!
//        mask[location.x, location.y] = VISITED
//        for n in matrix.neighboursOf(location: location) {
//            markSegment(location: n, type: type, matrix: &matrix, mask: &mask)
//        }
//    }
    
    func checkNeightbours(location: Location, type: String, matrix: inout Ma3x, mask: inout Ma3x) {
        if matrix[location.y, location.x] == type && !mask[location.y, location.x].isVisited{
            mask[location.y, location.x] = VISITED
            let neighbours = matrix.neighbours(of: location)

            for n in neighbours {
                checkNeightbours(location: n, type: type, matrix: &matrix, mask: &mask)
            }
        }

    }
    
    
    var m = Ma3x(rawData: matrix)
    var mask = m.mask
    m.printMe()
    mask.printMe()
    
    var segments = 0
    for i in 0..<m.height {
        for j in 0..<m.width {
            if !mask[i, j].isVisited {
                let type = m[i, j]
                let l = Location(x: j, y: i)
                checkNeightbours(location: l, type: type, matrix: &m, mask: &mask)
                segments += 1
            }
        }
    }
    
//    markSegment(location: Location(x: 0, y: 0), type: "$", matrix: &m, mask: &mask)
    
    return segments
}

extension String {
    var isVisited: Bool {
        return self == VISITED
    }
}


let testData:[String] = [
    "$$$$$$$$$$^^^^^",
    "$$$$$$$$$^^^^^^",
    "$$$$$$$^^^^хххх",
    "ххххххххххххххх",
    "ххххххххххххххх"
]

var mazeData:[[String]] = []
for item in testData {
    let row:[String] = item.map { return String($0) }
    mazeData.append(row)
}

//let myMatrix:Ma3x = Ma3x(rawData: mazeData)

print(countSegments(matrix: mazeData))



//myMatrix[0,0] = "&"
//print(myMatrix[0,0])

