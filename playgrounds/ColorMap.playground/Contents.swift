//: Преброяване на цветовите фрагменти върху квадратна мрежа.

//$$$$$$$$$$^^^^^
//$$$$$оооо^^^^^^
//$$$$$оо^^^^хххх
//ххххххххххххххх
//ххххххххххххххх
//
//отговор: 4

let EMPTY = "▫️"
let VISITED =  "✅"

//let EMPTY = "-"
//let VISITED =  "x"

struct Location {
    var x = 0
    var y = 0
}

struct Maze {
    var data:[[String]]
    var width:Int
    var height:Int
    
    init(arr:[[String]]) {
        data = arr
        height = arr.count
        if height > 0 {
            width = arr[0].count
        } else {
            width = 0
        }
    }
    
    init(width:Int, height:Int) {
        self.width = width
        self.height = height
        self.data = []
        for _ in 0..<height {
            var row:[String] = []
            for _ in 0..<width {
                row.append(EMPTY)
            }
            data.append(row)
        }
    }
    
    var mask: Maze {
        return Maze(width: self.width, height: self.height)
    }
    
    //    subscript (x:Int, y:Int) -> String {
    //        return data[x][y]
    //    }
    
    subscript (i:Int, j:Int) -> String {
        get {
            return data[i][j]
        }
        mutating set {
            data[i][j] = newValue
        }
    }
    
    func getNeighbours(location: Location) ->  [Location] {
        var n:[Location] = []
        if location.x > 0 {
            n.append(Location(x:location.x - 1, y:location.y))
        }
        
        if location.y > 0 {
            n.append(Location(x:location.x, y:location.y - 1))
        }
        
        if location.x + 1 < self.width {
            n.append(Location(x:location.x + 1, y:location.y))
        }
        
        if location.y + 1 < self.height {
            n.append(Location(x:location.x, y:location.y + 1))
        }
        
        return n
    }
    
    func printMaze() {
        print("Maze: \(width) x \(height):")
        for row in data {
            var line = ""
            for item in row {
                line.append(item)
            }
            print(line)
        }
        
    }
    
    func printWithMask(mask: Maze) {
        print("")
        var r:Int = 0
        for row in data {
            var mz = ""
            var ms = ""
            
            for item in row {
                mz.append(item)
            }
            
            for i in 0..<mask.width {
                ms.append(mask[r, i])
            }
            
            r += 1
            let line = "\(mz) \(ms)"
            print(line)
        }
    }
}

extension String {
    
    var isEmptyMazeSquare:Bool {
        return self == EMPTY
    }
    
    func replace(map: [String: String]) -> String {
        var str = ""
        for char in self {
            if let replaced = map[String(char)] {
                str += replaced
            } else {
                str += String(char)
            }
            
        }
        return str
    }
}

func countSegments(maze:[[String]]) -> Int {
    func checkNeightbours(location: Location, type: String, maze: inout Maze, mask: inout Maze) {
        if maze[location.y, location.x] == type && mask[location.y, location.x].isEmptyMazeSquare{
            mask[location.y, location.x] = VISITED
            let neighbours = maze.getNeighbours(location: location)
            
            for n in neighbours {
                checkNeightbours(location: n, type: type, maze: &maze, mask: &mask)
            }
        }
        
    }
    
    var segments = 0
    var myMaze = Maze(arr: maze)
    var myMask = myMaze.mask
    
    for i in 0..<myMaze.height {
        for j in 0..<myMaze.width {
            if myMask[i,j].isEmptyMazeSquare {
                let type = myMaze[i, j]
                segments += 1
                //j - колони
                //i - редове
                checkNeightbours(location: Location(x:j, y:i), type: type, maze: &myMaze, mask: &myMask)
                
                //debug
                //                myMask.printMaze()
                myMaze.printWithMask(mask: myMask)
            }
        }
    }
    
    
    return segments
}


let testData:[String] = [
    "$$$$$$$$$$^^^^^",
    "$$$оо$$$$^^^^^^",
    "$$$$$$$^^^^хххх",
    "ххххххххххххххх",
    "ххххххххххххххх"
]

let map = ["$":"🇧🇬", "о":"🇰🇷", "^": "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "х":"🇺🇸" ]

var mazeData:[[String]] = []
for item in testData {
    let row:[String] = item.replace(map: map).map { return String($0) }
    mazeData.append(row)
}

print(countSegments(maze: mazeData))

//let maze = Maze(arr: mazeData)
//maze.printMaze()
//maze.mask.printMaze()



