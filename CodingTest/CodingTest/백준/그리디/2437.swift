import Foundation

let n = Int(readLine()!)!
var choo = readLine()!.split(separator: " ").map{Int(String($0))!}

choo = choo.sorted(by: <)
var sum = choo[0]
var answer = 0
var flag = false

if sum > 1{
    sum = 0
}
else {
    for i in 1..<n {
        
        if flag {
            break
        }
        
        if choo[i] <= sum {
            sum += choo[i]
        }
        else {
            if sum + 1 == choo[i] {
                sum += choo[i]
            }
            else {
                flag = true
                break
            }
        }
    }
}

print(sum+1)
