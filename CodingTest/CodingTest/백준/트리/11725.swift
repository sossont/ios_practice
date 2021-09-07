import Foundation

let N = Int(readLine()!)!

var parent = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)
var ans = Array(repeating: 0, count: N+1)

func dfs(n:Int) {
    visited[n] = true
    
    for i in 0..<parent[n].count {
        let next = parent[n][i]
        if visited[next] == false{
            ans[next] = n
            dfs(n: next)
        }
    }
}
for _ in 1..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let a = input[0]
    let b = input[1]
    parent[a].append(b)
    parent[b].append(a)
    
}

dfs(n: 1)

for i in 2...N {
    print(ans[i])
}
