// Цикличен буфер

struct RingBuffer {
    fileprivate var store: [Int?]
    private var readIndex = 0
    private var writeIndex = 0
    
    init(count: Int) {
        store = [Int?](repeating: nil, count: count)
    }
    
    private var readSpace: Int {
        return writeIndex - readIndex
    }
    
    var isEmpty: Bool {
        return readSpace == 0
    }
    
    private var writeSpace: Int {
        return store.count - readSpace
    }
    
    var isFull: Bool {
        return writeSpace == 0
    }
    
    mutating func write(_ element: Int) -> Bool {
        guard isFull == false else {
            return false
        }
        
        let nextWriteIndex = writeIndex%store.count
        store[nextWriteIndex] = element
        writeIndex += 1
        
        return true
    }
    
    mutating func read() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        let nextReadIndex = readIndex%store.count
        let element = store[nextReadIndex]
        readIndex += 1
        
        return element
    }
}

var buffer = RingBuffer(count: 4)

buffer.write(1)
buffer.write(2)
buffer.write(3)

buffer.store
buffer.read()
buffer.read()

buffer.write(4)
buffer.write(5)

buffer.store

buffer.read()
buffer.read()
buffer.read()
buffer.read()
