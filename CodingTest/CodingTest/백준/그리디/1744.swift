import Foundation

let n = Int(readLine()!)!
var array = [Int]()
for _ in 0..<n {
    let input = Int(readLine()!)!
    array.append(input)
}

array = array.sorted(by: <)
var zero = [Int]()
var minus = [Int]()
var plus = [Int]()

for num in array {
    if num < 0 {
        minus.append(num)
    }
    else if num == 0{
        zero.append(num)
    }
    else {
        plus.append(num)
    }
}


var answer = 0
let mcount = minus.count
if mcount % 2 == 0 {    // 짝수개 일때.
    if mcount != 0{
        for i in 0...mcount/2 - 1 {
            answer += minus[2*i]*minus[2*i+1]
        }
    }
}
else { // 홀수 개 일때.
    if mcount == 1 {    // 단 1개 존재하는 경우.
        if zero.count == 0 {
            answer += minus[0]
        }
    }
    else if mcount > 1 {
        for i in 0...mcount/2-1{
            answer += minus[2*i+1] * minus[2*i]
        }
        
        if zero.count == 0 {
            answer += minus[mcount - 1]   // 절대값이 제일 작은 것은 더해준다. 0이 있으면 0이랑 묶기때문에 없어짐.
        }
        
    }
}


plus = plus.sorted(by: >)

let pcount = plus.count

var count = 0
for i in 0..<pcount {
    
    if plus[i] == 1 {   // 1이면 곱하지 말고 더하는게 더 크다.
        if count != 0 {
            answer += plus[i-1]
            count = 0
        }
        answer += 1
        continue
    }
    else {
        if count == 0 {
            count += 1
            if i == pcount - 1{ // 만약 끝 숫자면 그냥 더해야 한다. 마지막이니까 곱할 숫자가 없음.
                answer += plus[i]
            }
        }
        else if count == 1 {
            count = 0
            answer += plus[i] * plus[i-1]
        }
    }
}

print(answer)
