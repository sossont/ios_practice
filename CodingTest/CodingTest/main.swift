//
//  main.swift
//  CodingTest
//
//  Created by 정환우 on 2021/06/23.
//

import Foundation
func divdiv(_ div : Int, _ x:Int, _ y:Int){
    let start = video[y][x]
    if div == 1{
        print(start,terminator: "")
        return
    }
    
    var flag = true
    for i in 0...div-1{
        for j in 0...div-1{
            if video[y+i][x+j] != start{
                flag = false
                break
            }
        }
        if flag == false{
            break
        }
    }
    
    if flag == false{
        print("(",terminator: "")
        let ndiv = div / 2
        divdiv(ndiv,x,y)
        divdiv(ndiv,x+ndiv,y)
        divdiv(ndiv,x,y+ndiv)
        divdiv(ndiv,x+ndiv,y+ndiv)
        print(")",terminator: "")
    }
    else{
        print(start,terminator: "")
    }
}

var video: [[Int]] = Array(repeating: Array(repeating: -1, count: 64), count: 64)
var N = Int(readLine()!)!
var one = 0
var zero = 0

for x in 0...N-1{
    let input = Array(readLine()!).map { Int(String($0))! }
    for y in 0...N-1{
       video[x][y] = input[y]
        if video[x][y] == 0{
            zero += 1
        }
        else{
            one += 1
        }
    }
}

if zero == N{
    print(0)
}
else if one == N{
    print(1)
}
else{
    divdiv(N,0,0)
}




