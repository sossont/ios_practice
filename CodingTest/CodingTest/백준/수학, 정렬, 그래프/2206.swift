import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0], M = input[1]

var map = Array(repeating: [Int](), count: N+1) // N행 M렬.

for i in 1...N {
    let inp = Array(readLine()!).map{Int(String($0))!}
    map[i].append(0)
    map[i].append(contentsOf: inp)
}

var dp :[[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: 1001), count: 1001)

let d = [(1,0),(-1,0),(0,1),(0,-1)]

func check(x:Int, y:Int) -> Bool{
    
    if x>0 && y>0 && x<=M && y<=N {
        return true
    }
    
    return false
}

func bfs() -> Int {

    var queue = [(Int,Int,Int)]()
    queue.append((1,1,0)) // 첫 좌표. 벽은 0개 부쉈다. (y,x,wall)
    dp[1][1][0] = 1
    var index = 0
    
    while index < queue.count {
        let now = queue[index]
        index += 1
        let y = now.0
        let x = now.1
        let wall = now.2
        
        if y == N && x == M {
            return dp[y][x][wall]
        }
        
        for i in 0..<4 {
            let ny = y + d[i].0
            let nx = x + d[i].1
            
            if check(x: nx, y: ny) {
                if map[ny][nx] == 1 {
                    if wall == 0 {
                        dp[ny][nx][wall+1] = dp[y][x][wall] + 1
                        queue.append((ny,nx,wall+1))
                    }
                }
                else {
                    // 방문하지 않았다면
                    if dp[ny][nx][wall] == 0 {
                        dp[ny][nx][wall] = dp[y][x][wall] + 1
                        queue.append((ny,nx,wall))
                    }
                }
            }
        }
    }
    
    return -1
}

print(bfs())
