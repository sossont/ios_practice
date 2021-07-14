import Foundation

let input = readLine()!.map{String($0)}
let ascii = Character("A").asciiValue!

var answer = 0

for chr in input{
    let asc = Int(Character(chr).asciiValue! - ascii)
    let num = asc / 3   // 0이면 ABC, 1이면 DEF 이렇게.
    var time = 0
    //15부터가 문제. S가 18인데 7임.
    
    if asc >= 18 {
        if asc == 18{
            time = 8
        }
        else if asc <= 21{
            time = 9
        }
        else{
            time = 10
        }
    }
    else{
        time = num + 3
    }
    answer += time
}

print(answer)

