//
//  10809.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/14.
//

import Foundation

let array = Array(readLine()!).map{ String($0)}
let a = "a"
var answer : [Int] = Array(repeating: -1, count: 26)
let len = array.count
for i in 0...len-1{
    let n = array[i]
    let newindex = Int(Character(n).asciiValue! - Character(a).asciiValue!)
    if answer[newindex] == -1{
        answer[newindex] = i
    }
}

for i in answer{
    print(i,terminator: " ")
}
