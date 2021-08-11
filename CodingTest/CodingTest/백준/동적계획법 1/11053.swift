import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map{Int($0)!}

var length = Array(repeating: 0, count: N)

var answer = 1
// 1. DP로 푸는 경우.
for k in 0..<N {
    length[k] = 1
    for i in 0..<k {
        if A[i] < A[k] {
            length[k] = max(length[k], length[i]+1)
            answer = max(length[k],answer)
        }
    }
}

print(answer)
