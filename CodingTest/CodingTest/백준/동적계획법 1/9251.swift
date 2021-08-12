import Foundation

let firststr = readLine()!.map{$0}
let secondstr = readLine()!.map{$0}

var dp = Array(repeating: Array(repeating: 0, count: secondstr.count + 1), count: firststr.count + 1)


for i in 1...firststr.count {
    for j in 1...secondstr.count {
        if firststr[i-1] == secondstr[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        }
        else
        {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
        }
    }
}

let a = firststr.count
let b = secondstr.count

print(dp[a][b])
