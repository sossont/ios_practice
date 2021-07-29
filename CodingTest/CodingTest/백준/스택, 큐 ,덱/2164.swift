import Foundation

let N = Int(readLine()!)!

class Queue{
    var enqueue:[Int]
    var dequeue:[Int] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count:Int {
        return enqueue.count + dequeue.count
    }
    
    func push(_ x: Int){
        enqueue.append(x)
    }
    
    func pop() -> Int? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    init(_ queue:[Int]) {
        self.enqueue = queue
    }
}

var arr = [Int]()
for i in 1...N  {
    arr.append(i)
}
var queue:Queue = Queue(arr)
while queue.count != 1 {
    let _ = queue.pop()
    if let second = queue.pop() {
        queue.push(second)
    }
}

print(queue.pop()!)
