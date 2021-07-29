import Foundation

let input1 = readLine()!.components(separatedBy: " ").map{Int($0)!}
let jimin = readLine()!.components(separatedBy: " ").map{Int($0)!}
let N = input1[0]
let M = input1[1]
var queue:[Int] = Array()

for i in 1...N {
    queue.append(i)
}   // 큐 초기화.

var answer = 0
for num in jimin {
    
    let index = queue.firstIndex{$0 == num}!
    let count = queue.count
    
    if index <= count - index { // 그냥 정방향으로 가는게 빠르면. 2번 케이스.
        while queue.first != num {
            queue.reverse()
            let end = queue.popLast()!
            queue.reverse()
            queue.append(end)
            answer += 1
        }
        queue.reverse()
        queue.popLast()
        queue.reverse()
    }
    else {  // 3번 케이스
        while queue.first != num {
            let end = queue.popLast()!
            queue.reverse()
            queue.append(end)
            queue.reverse()
            answer += 1
        }
        queue.reverse()
        queue.popLast()
        queue.reverse()
    }
}

print(answer)
