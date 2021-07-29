import Foundation

let tc = Int(readLine()!)!
for _ in 1...tc {
    
    let n = readLine()!.split(separator: " ").map { Int(String($0))! }
    var importance = readLine()!.split(separator: " ").enumerated().map { (index, element) in
    return [Int(String(element))!, index]}
    var answer = [[Int]]()
    while !importance.isEmpty {
        if let first = importance.first, let max = importance.max(by: { $0[0] < $1[0]}) {
            if first[0] == max[0] {
                answer.append(importance.removeFirst())
            }
            else{
                importance.append(importance.removeFirst())
            }
        }
    }
    
    if let find = answer.firstIndex(where: {$0[1] == n[1]}) {
        print(find+1)
    }
}
