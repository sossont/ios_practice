import Foundation

let tc = Int(readLine()!)!

for _ in 1...tc{
    let input = readLine()?.split(separator: " ")
    let r = Int(input![0])!
    let str = input![1].map{String($0)}
    var answer: String = ""
    for s in str{
        for _ in 1...r{
            answer += s
        }
    }
    print(answer)
}
