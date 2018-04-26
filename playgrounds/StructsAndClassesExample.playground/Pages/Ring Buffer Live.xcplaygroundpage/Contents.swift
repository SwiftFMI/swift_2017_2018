// Да дефинираме структура Цикличен Буфер - това е списък, който се връща в началото си и при добавяне на елемент, никога не се разширява (презаписва първия, втория и т.н.)
// Той трябва да има функции за запис(write), четене(read) и {get} полета isEmpty, isFull

/* празен (и.писане=и.четене)
 [nil, nil, nil, nil]
  ч
  п
 */

/* п <- 1
 [1, nil, nil, nil]
  ч
  -->п
 */

/* п <- 2, 3
 [1, 2, 3, nil]
  ч
  -------->п
 */

/* ч -> 2
 [1, 2, 3, nil]
  -->ч
           п
 */

/* ч -> 3
 [1, 2, 3, nil]
  ----->ч
           п
 */

/* п -> 4, 5
 [5, 2, 3, 4]
        ч
---->п---------->
 */

/* ч -> 4, 5 - празен
 [5, 2, 3, 4]
---->ч---------->
     п
 */
/*
struct RingBuffer {
    var store: [Int?]
    var readIndex = 0
    var writeIndex = 0
    
    init(count: Int) {
        store = [Int?](repeatElement(nil, count: count))
    }
    
    var readSpace: Int {
        return writeIndex-readIndex
    }
    
    var isEmpty: Int {
        return readSpace == 0
    }
    
    var writeSpace: Int {
        return store.count-writeIndex
    }
    
    var isFull: Bool {
        return writeSpace == 0
    }

    mutating func write(_ element: Int) -> Bool {
        guard isFull == false else {
            return false
        }
        
        let current = writeIndex%store.count
        store[current] = element
        
        writeIndex += 1
        
        return true
    }
    
    mutating func read() -> Int? {
        guard isEmpty == false else {
            return nil
        }
        
        let current = readIndex%store.count
        readIndex += 1
        
        return store[current]
    }
}
*/
