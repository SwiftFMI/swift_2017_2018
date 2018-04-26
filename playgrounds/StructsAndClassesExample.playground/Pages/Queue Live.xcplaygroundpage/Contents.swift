// Да дефинираме структура Опашка (FIFO - first-in first-out), която има функции enqueue и dequeue
// Стека трябва да има и {get} полета count: Int, isEmpty: Bool, front: Int

struct Queue {
    var store = [Int]()
    
    var isEmpty: Bool {
        return store.isEmpty
    }

    var count: Int {
        return store.count
    }
    
    var front: Int? {
        return store.first
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        return store.removeFirst()
    }
}

var queue = Queue()

queue.isEmpty
queue.enqueue(1)

queue.front

queue.enqueue(2)

queue.dequeue()
queue.dequeue()
