import Foundation

var isvisit = Array(repeating: false, count: 501)
var graph = Array(repeating: [Int](), count: 501)

func DFS(_ num: Int, _ before: Int) -> Bool{
    isvisit[num] = true
    
    for child in graph[num] {
        if child == before {
            continue
        }
        if isvisit[child] == true {
            return false
        }
        if !DFS(child, num) {
            return false
        }
    }
    
    return true
}

var t = 1

while(true) {
    let inp = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = inp[0]
    let m = inp[1]
    if n == 0 && m == 0 {
        break
    }
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    var answer = 0
    for i in 1...n {
        if DFS(i,0) == true {
            answer += 1
        }
    }
    
    if answer == 0 {
        print("Case \(t): No trees.")
    }
    else if answer == 1 {
        print("Case \(t): There is one tree.")
    }
    else {
        print("Case \(t): A forest of \(answer) trees.")
    }
    t+=1
    isvisit.removeAll()
    graph.removeAll()
    isvisit = Array(repeating: false, count: 501)
    graph = Array(repeating: [Int](), count: 501)
}
