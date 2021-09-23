import Foundation

let N = Int(readLine()!)!

var conf = [(Int,Int)]()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input[0]
    let end = input[1]
    conf.append((end,start))
}

conf.sort(by: <)
var minend = 0
var answer = 0
for c in conf {
    let start = c.1
    let end = c.0
    if start >= minend {
        minend = end
        answer += 1
    }
}

print(answer)
