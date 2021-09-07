import Foundation

var T = Int(readLine()!)!
var isPrime : [Int] = Array(repeating: 0, count: 10001)
isPrime[1] = 1

for i in 4...10000 {
    let sqj = Int(sqrt(Double(i)))
    for j in 2...sqj {
        if i % j == 0
        {
            isPrime[i] = 1
            break
        }
    }
}


while T > 0 {
    T -= 1
    let n = Int(readLine()!)!
    var a = n / 2
    var b = n / 2
    while true {
        if isPrime[a] == 0 && isPrime[b] == 0 {
            break
        }
        a -= 1
        b += 1
    }
    
    print("\(a) \(b)")
}

