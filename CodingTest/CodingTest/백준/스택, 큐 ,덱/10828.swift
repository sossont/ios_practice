import Foundation

let N = Int(readLine()!)!

var stack: [Int] = Array(repeating: 0, count: 1000000) // 최대 백만 개.
var top = -1 // -1이면 비어있는 것.
for _ in 1...N{
    let input = String(readLine()!)
    let sepinput = input.components(separatedBy: " ")   //공백 기준으로.
    if sepinput[0] == "top"{
        if(top == -1){
            print(top)
        }
        else{
            print(stack[top])
        }
    }
    else if sepinput[0] == "size"{
        print(top+1)
    }
    else if sepinput[0] == "empty"{
        if(top == -1){
            print(1)
        }
        else{
            print(0)
        }
    }
    else if sepinput[0] == "pop"{
        if(top == -1){
            print(top)
        }
        else{
            print(stack[top])
            top -= 1
        }
    }
    else if sepinput[0] == "push"{
        top += 1
        stack[top] = Int(sepinput[1])!
    }
}
