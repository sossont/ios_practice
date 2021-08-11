import Foundation

let n = readLine()!
let arr = readLine()!.split(separator: " ").map{Int($0)!}

var dp : [Int] = Array(repeating: 0, count: 100000)

dp[0] = arr[0]
var max = dp[0] // -1000보다 크거나 같은 정수들로 이루어져 있다.
for i in 1..<arr.count {
    if dp[i-1] > 0
    {
        dp[i] = dp[i-1] + arr[i]
    }
    else{
        dp[i] = arr[i]
    }
    
    if max < dp[i]{
        max = dp[i]
    }
}

print(max)
