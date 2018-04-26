struct Queue {
    fileprivate var store = [Int?]()
    private var first = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return store.count - first
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        guard isEmpty == false, first < store.count, let element = store[first] else {
            return nil
        }
        
        store[first] = nil
        first += 1
        
        let empty = Double(first)/Double(store.count)
        if store.count > 5 && empty > 0.3 {
            store.removeFirst(first)
            first = 0
        }
        
        return element
    }
    
    var front: Int? {
        guard isEmpty == false else {
            return nil
        }
        
        return store[first]
    }
}

var queue = Queue()
queue.isEmpty

queue.enqueue(1)
queue.front
queue.enqueue(2)
queue.front
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)

queue.isEmpty
queue.count

queue.dequeue()
queue.dequeue()

queue.front

queue.store


