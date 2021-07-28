//
//  1546.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

let N = Int(readLine()!)!

var score : [Float] = readLine()!.split(separator: " ").map{Float($0)!}
let sortscore = score.sorted()
let highscore = sortscore[N-1]
var sum : Float = 0
for i in 0...N-1{
    sum += ( score[i] / (highscore / 100) )
}
let answer = sum / Float(N)
print(answer)
