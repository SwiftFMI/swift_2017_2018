// Да дефинираме структура Стек (LIFO - last-in first-out), който има функции push и pop.
// Стека трябва да има и {get} полета count: Int, isEmpty: Bool, top: Int

struct Stack {
    var store = [Int]()
    
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
        guard isEmpty == false else {
            return nil
        }
        
        return store.removeLast()
    }
    
    var top: Int? {
        return store.last
    }
}

var stack = Stack()
stack.isEmpty

stack.push(1)
stack.top

stack.pop()

stack.pop()
