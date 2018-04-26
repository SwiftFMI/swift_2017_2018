// dequeue функцията е бавна (махаме първия елемент и преместваме всички останали с 1 наляво)
// Да оптимизираме тази хункция, пазейки индекс на последно извадения елемент и да "почисваме" периодично

struct Queue {
    var store = [Int?]()
    var head = 0
    //fileprivate, за да видим промените, Int?, защото искаме nil елементи
    // head/first индекс
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return store.count - head
    }
    
    mutating func enqueue(_ element: Int) {
        store.append(element)
    }
    
    mutating func dequeue() -> Int? {
        // добавяме проверка за индекса < броя елементи, вземаме елемента на индекса
        guard isEmpty == false, head < store.count, let element = store[head] else {
            return nil
        }
        
        store[head] = nil
        head += 1
        
        let emptyPart = Double(head)/Double(store.count)
        
        if emptyPart > 0.3 && store.count > 5 {
            store.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: Int? {
        if isEmpty {
            return nil
        }
        
        return store[head]
    }
}

var queue = Queue()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
queue.enqueue(6)

queue.store

queue.dequeue()
queue.store

queue.dequeue()
queue.dequeue()
queue.dequeue()

queue.store

