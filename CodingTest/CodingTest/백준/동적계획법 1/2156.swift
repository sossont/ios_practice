import Foundation

let n = Int(readLine()!)!
var wine : [Int] = Array(repeating: 0, count: n+1)
var dp : [Int] = Array(repeating: 0, count: n+1)

var l : Int
for i in 0..<n {
    if let l = readLine(){
        wine[i] = Int(l) ?? 0
    }
}


var answer : Int
dp[0] = wine[0]
if n == 1 {
    answer = dp[0]
}
else if n == 2{
    answer = wine[0] + wine[1]
}
else {
    dp[1] = wine[0] + wine[1]
    dp[2] = max(wine[0] + wine[1], wine[1] + wine[2], wine[0]+wine[2])
    for i in 3...n {
        dp[i] = max(dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i])
        dp[i] = max(dp[i-1],dp[i])
    }
    answer = dp[n-1]
}
print(answer)
