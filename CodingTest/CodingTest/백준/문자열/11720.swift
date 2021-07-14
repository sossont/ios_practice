import Foundation

let N = Int(readLine()!)!

let array = Array(readLine()!).map{ Int(String($0))!}

var answer = 0
for n in array{
    answer += n
}
print(answer)
