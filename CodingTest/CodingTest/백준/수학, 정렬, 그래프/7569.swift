import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let m = input[0], n = input[1], h = input[2]

var box:[[[Int]]] = Array(repeating: [[Int]](repeating: [Int](), count: n), count: h)

// 박스 입력 받기.
for z in 0..<h {
    for y in 0..<n {
        let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
        box[z][y].append(contentsOf: input2)
    }
}

let d = [(-1,0,0), (1,0,0), (0,-1,0), (0,1,0), (0,0,1), (0,0,-1)]   // 6 방향. (x,y,z).

var queue = [(Int,Int,Int)]()   // x,y,z 하나씩 들어가야지.


func check(x: Int, y:Int, z:Int) -> Bool {
    if x>=0 && y>=0 && z>=0 && x<m && y<n && z<h {
        return true
    }
    
    return false
}

func bfs(){
    var index = 0
    while index < queue.count {
        // 큐 비우는 거 대신에 idx로 대신.
        let now = queue[index]
        index += 1
        
        for i in 0..<6 {
            let nx = now.0 + d[i].0
            let ny = now.1 + d[i].1
            let nz = now.2 + d[i].2
            
            if check(x: nx, y: ny, z: nz) {
                if box[nz][ny][nx] == 0 {
                    queue.append((nx,ny,nz))
                    box[nz][ny][nx] = box[now.2][now.1][now.0] + 1
                }
            }
            
        }
    }
}

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if box[z][y][x] == 1{
                queue.append((x,y,z))
            }
        }
    }
}

var result = 0
bfs()
var flag = false    // -1이 존재하는 경우.

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if box[z][y][x] == 0 {
                result = 0
                flag = true
                break
            }
            else{
                result = max(result, box[z][y][x])
            }
        }
        
        if flag {
            break
        }
    }
    
    if flag {
        break
    }
}

print(result-1)
