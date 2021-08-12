
import Foundation

let N = Int(readLine()!)!

var dp:[Int] = Array(repeating: 0, count: 1000001) // 메모지에이션.

dp[1] = 0
dp[2] = 1
dp[3] = 1

if N >= 4 {
    for i in 4...N {
        dp[i] = dp[i-1] + 1
        if i % 3 == 0 {
            if dp[i] > dp[i/3] + 1 {
                dp[i] = dp[i/3] + 1
            }
        }
        
        if i % 2 == 0 {
            if dp[i] > dp[i/2] + 1 {
                dp[i] = dp[i/2] + 1
            }
        }
    }
}
print(dp[N])
