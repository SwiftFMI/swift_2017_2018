struct Stack {
    private var store = [Int]()
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    var count: Int {
        return store.count
    }
    
    mutating func push(_ element: Int) {
        store.append(element)
    }
    
    mutating func pop() -> Int? {
        return store.popLast()
    }
    
    var top: Int? {
        return store.last
    }
}

var stack = Stack()
stack.isEmpty

stack.push(12)
stack.top
stack.push(31)
stack.top

stack.isEmpty
stack.count

stack.pop()
stack.pop()
stack.pop()

stack.top
