import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let K = input[1]

var dp = Array(repeating: Array(repeating: -1, count: 100), count: 100001)
var weight = Array(repeating: 0, count: 100)
var value = Array(repeating: 0, count: 100)

for i in 0..<N {
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    weight[i] = input2[0]
    value[i] = input2[1]
}

// 입력 작업 완료.
var answer = 0

func knapsack(w: Int, number: Int) -> Int {
    if number == N {
        return 0
    }
    
    if dp[w][number] != -1 {
        return dp[w][number]
    }
    
    dp[w][number] = knapsack(w: w, number: number + 1)  // 담지 않는 경우
    
    // 담는 경우.
    if w >= weight[number] {    // 여기서 w : 현재 담을 수 있는 무게. 즉 이 물건을 담을 수 있을 때.
        dp[w][number] = max(dp[w][number], knapsack(w: w - weight[number], number: number+1) + value[number])
    }
    
    return dp[w][number]
}

knapsack(w: K, number: 0)
print(dp[K][0])
