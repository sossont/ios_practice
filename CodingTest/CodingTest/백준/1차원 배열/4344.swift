//
//  4344.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

let C = Int(readLine()!)!

for _ in 1...C{
    var arr : [Float] = readLine()!.split(separator: " ").map{Float($0)!}
    var N = Int(arr[0])
    
    var sum : Float = 0
    for i in 1...N{
        sum += arr[i]
    }
    let mean : Float = sum / Float(N)
    var answer : Float = 0
    for i in 1...N {
        if arr[i] > mean {
            answer += 1
        }
    }
    
    let realanswer = String(format: "%.3f", answer / arr[0] * 100.0)
    print(realanswer + "%")
}
