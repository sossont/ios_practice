//
//  10818.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

let N = Int(readLine()!)!
let strarr = Array(readLine()!.split(separator: " ").map{ String($0)})
let arr = strarr.map{Int($0)!}

let narr = arr.sorted()
let maxnum = narr[N-1]
let minnum = narr[0]

print(minnum, maxnum)
