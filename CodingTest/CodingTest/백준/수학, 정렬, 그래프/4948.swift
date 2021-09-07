import Foundation

var isPrime : [Int] = Array(repeating: 0, count: 250001)
isPrime[1] = 1
for i in 4...250000 {
    let sqj = Int(sqrt(Double(i)))
    for j in 2...sqj {
        if i % j == 0
        {
            isPrime[i] = 1
            break
        }
    }
}

while true {
    let T = Int(readLine()!)!
    if T == 0 { // 0을 입력받으면 종료.
        break
    }
    
    var answer = 0
    for i in T+1...2*T{
        if isPrime[i] == 0{
            answer += 1
        }
    }
    
    print(answer)
}
