//
//  8958.swift
//  CodingTest
//
//  Created by 정환우 on 2021/07/08.
//

import Foundation

let test_case = Int(readLine()!)!
for _ in 1...test_case{
    
    var result = readLine()!    // String이니까 형변환 필요 없음

    var score = 0
    var o = 0
    for i in 0...result.count - 1{
        let ox = result[result.index(result.startIndex, offsetBy: i)]
        if ox == "O"{
            o += 1
        }
        else{
            o = 0
        }
        score += o
    }
    print(score)
}
