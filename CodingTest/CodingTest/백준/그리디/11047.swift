import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let K = input[1]

var coin = Array(repeating: 0, count: N)

for i in 0..<N {
    let c = Int(readLine()!)!
    coin[i] = c
}

coin.reverse()
var answer = 0
var value = K

var idx = 0
while true {
    if value == 0{
        break
    }
    
    if value >= coin[idx] {
        answer += 1
        value -= coin[idx]
    }
    else {
        idx += 1
    }
}

print(answer)
