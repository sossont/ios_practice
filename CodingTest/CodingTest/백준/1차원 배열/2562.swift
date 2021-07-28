//
//  2562.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

var maxnum = 0, maxindex = 0
for i in 1...9{
    let n = Int(readLine()!)!
    if maxnum < n{
        maxnum = n
        maxindex = i
    }
}
print(maxnum,terminator: "\n")
print(maxindex)
