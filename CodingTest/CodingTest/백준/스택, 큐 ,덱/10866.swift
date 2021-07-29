import Foundation

let n = Int(readLine()!)!

var deque:[Int] = Array()

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ")
    let check = input[0]
    
    if check == "pop_front" {
        if deque.isEmpty {
            print ("-1")
        }
        else{
            deque.reverse()
            print(deque.popLast()!)
            deque.reverse()
        }
    }
    else if check == "pop_back" {
        if deque.isEmpty {
            print ("-1")
        }
        else
        { print(deque.popLast()!) }
    }
    else if check == "size" {
        print(deque.count)
    }
    else if check == "empty" {
        if deque.isEmpty { print("1") }
        else { print("0")}
    }
    else if check == "front" {
        if deque.isEmpty {
            print ("-1")
        }
        else { print(deque[0])}
    }
    else if check == "back" {
        if deque.isEmpty {
            print ("-1")
        }
        else{
            print(deque.last!)
        }
    }
    else if check == "push_front" {
        let num = Int(input[1])!
        deque.insert(num, at: 0)
    }
    else if check == "push_back" {
        let num = Int(input[1])!
        deque.append(num)
    }
}
