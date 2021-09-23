import Foundation

let input = readLine()!.split(separator: "-").map{String($0)}
let plus = input[0].split(separator: "+").map{Int(String($0))!}
var answer = 0
for num in plus {
    answer += num
}

var tmp = 0
for i in 1..<input.count {
    let num = input[i].split(separator:"+").map{Int(String($0))!}
    for t in num{
        tmp += t
    }
}

answer = answer - tmp
print(answer)
