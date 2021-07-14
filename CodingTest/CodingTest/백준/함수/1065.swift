import Foundation

let n = Int(readLine()!)!
var answer : [Int] = Array(repeating: 0, count: 1001)
func hansu(n: Int){
    if n == 1{
        answer[n] = 1
    }
    else if n / 10 == 0 || n / 10 <= 9{ // 한 자리 수나 두 자리 수 일때는 무조건 한 수.
        answer[n] = answer[n-1] + 1
    }
    else if n / 100 != 0{   // 세 자리 수일때.
        let a = n / 100 // 백의 자리.
        let b = (n / 10) % 10   // 십의 자리.
        let c = n % 10  // 일의 자리.
        if (a-b) == (b-c){
            answer[n] = answer[n-1] + 1
        }
        else{
            answer[n] = answer[n-1]
        }
    }
    else{
        answer[n] = answer[n-1]
    }
}

for i in 1...n{
    hansu(n:i)
}
print(answer[n])
