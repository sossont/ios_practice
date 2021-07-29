import Foundation

let n = Int(readLine()!)!

var arr : [Int] = Array()
var stack : [Int] = Array()

// n개의 수를 입력 받는다.

for _ in 1...n {
    let input = Int(readLine()!)!
    arr.append(input)
}
var index = 0
var answer : [String] = Array()
for i in 1...n+1 {
    if stack.isEmpty && i != n+1
    {
        stack.append(i)
        answer.append("+")
    }
    else
    {
        while !stack.isEmpty && stack.last! == arr[index] {
            stack.removeLast()
            answer.append("-")
            index += 1
        }
        if i != n+1 {
            stack.append(i)
            answer.append("+")
        }
    }
}

// 스택이 비어있지 않으면 표현 불가능한 경우다.
if !stack.isEmpty
{
    print("NO")
}
else
{
    for str in answer {
        print(str)
    }
}

