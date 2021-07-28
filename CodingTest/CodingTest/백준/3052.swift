

import Foundation

var arr : [Int] = Array(repeating: 0, count: 42)    // 0~41 까지.

for _ in 0...9{
    let input = Int(readLine()!)!
    arr[input % 42] += 1
}
var answer = 0;
for i in 0...41{
    if arr[i] != 0{
        answer += 1
    }
}

print(answer)
