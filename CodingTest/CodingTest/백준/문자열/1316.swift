import Foundation

let N = Int(readLine()!)!
let ascii = Int(Character("a").asciiValue!)
var answer = 0
for _ in 1...N{
    var arr : [Int] = Array(repeating: 0, count: 26)
    let word = readLine()!.map{String($0)}
    var previous = -1
    var isgroup = true
    for chr in word{
        let charascii = Int(Character(chr).asciiValue!) - ascii
        if previous != charascii && arr[charascii] != 0{    // 그룹단어가 아니다.
            isgroup = false
            break
        }
        previous = charascii
        arr[charascii] += 1
    }
    if isgroup{
        answer += 1
    }
}
print(answer)


