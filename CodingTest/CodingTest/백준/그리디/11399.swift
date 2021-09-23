import Foundation

let N = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [Int]()
for people in input {
    arr.append(people)
}

var answer = 0
var time = 0
arr.sort(by: <)

for people in arr {
    time += people
    answer += time
}

print(answer)

