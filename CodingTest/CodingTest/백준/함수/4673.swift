import Foundation

var arr : [Int] = Array(repeating: 0, count: 10000) // 10000보다 작거나 같은 수가 생성자가 있는지 없는지 판단.

func d(n: Int) -> Int{
    if n / 10 == 0{
        return n
    }
    else{
        var ret = 0
        var newn = n
        while(newn != 0){
            ret += newn % 10
            newn = newn / 10
        }
        return ret
    }
}

for i in 1...10000{
    let newindex = (i + d(n: i))
    if newindex < 10000{
        arr[newindex] += 1
    }
}
for i in 1...9999{
    if arr[i] == 0{
        print(i,terminator: "\n")
    }
}

