//
//  2577.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let mul = A * B * C
let strmul = (String(mul))
let strarr : [Character] = []

var count : [Int] = Array(repeating: 0, count: 10)  // 1부터 9로 편하게 쓰자.
for i in 0...strmul.count-1{
    let mulchar = strmul[strmul.index(strmul.startIndex, offsetBy: i)]
    let num = Int(String(mulchar))!
    count[num] += 1
}

for i in 0...9{
    print(count[i],terminator: "\n")
}
