import Foundation

struct stack {
    var value : Int // 숫자 값이랑.
    var index : Int // 그 숫자가 원래 있던 인덱스 값.
}

let N = Int(readLine()!)!
let A = Array(readLine()!.split(separator: " ").map{ Int(String($0))!})

var s : [stack] = Array()
var answer : [Int] = Array(repeating: -1, count: N)
for i in 0...N-1 {
    // stack이 비어 있을 때.
    let pair : stack = stack(value: A[i], index: i)
    if s.isEmpty
    {
        s.append(pair)
    }
    else
    {
        if A[i] > s.last!.value {
            while !s.isEmpty && A[i] > s.last!.value
            {
                let index = s.last!.index
                s.removeLast()
                answer[index] = A[i]
            }
            s.append(pair)
        }
        else
        {
            s.append(pair)
        }
    }
}

for ans in answer{
    print(ans, terminator: " ")
}
