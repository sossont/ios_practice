import Foundation

let MAX = 1000000000    // 이걸로 나눈 나머지.

let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N+1)

for i in 1...9 {
    dp[1][i] = 1
}

if (N>=2){
    for n in 2...N {
        for i in 0...9 {
           if i == 9 {
                dp[n][i] = dp[n-1][i-1] % MAX
            }
           else if i == 0 {
            dp[n][i] = dp[n-1][i+1] % MAX
           }
            else
            {
                dp[n][i] = (dp[n-1][i-1] % MAX + dp[n-1][i+1] % MAX)
            }
        }
    }
}
var answer = 0
for i in 0...9 {
    answer += dp[N][i]
}
answer %= MAX
print(answer)

