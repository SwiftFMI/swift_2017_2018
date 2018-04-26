struct Queue {
    var store = [Int]()
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    var count: Int {
        return store.count
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        return store.removeFirst()
    }
    
    var front: Int? {
        return store.first
    }
}

var queue = Queue()
queue.isEmpty

queue.enqueue(27)
queue.front
queue.enqueue(38)
queue.front

queue.isEmpty
queue.count

queue.dequeue()

queue.store



queue.dequeue()

queue.front
