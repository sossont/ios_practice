import Foundation

let n = Int(readLine()!)!
let dist = readLine()!.split(separator: " ").map{Int(String($0))!}
let price = readLine()!.split(separator: " ").map{Int(String($0))!}

var idx = 0
var minprice = price[idx]   // 첫 가격을 최소 가격으로 정해놓자.
var answer = 0

while true {
    answer += minprice * dist[idx]
    idx += 1
    
    if idx == n-1 {
        break
    }
    
    if minprice >= price[idx] {
        minprice = price[idx]
    }
    
}

print(answer)
