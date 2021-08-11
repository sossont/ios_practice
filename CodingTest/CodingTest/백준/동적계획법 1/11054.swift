import Foundation

// 풀이 방법 : 모든 지점에서 정방향과 역방향의 LIS를 구해서 그 합이 가장 최대인 지점이 정답이다.
// LIS 과정에서는 이분 탐색을 사용했다.


let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int($0)!}
var answer = Array(repeating: 0, count: n)   // 합을 저장해 놓을 배열.

func binary_search(s:Int, e:Int, target:Int, array: [Int]) -> Int {
    var start = s, end = e
    var middle = (start + end) / 2
    while start < end {
    // start, end 는 인덱스. target이랑 array[middle]은 그 값.
        middle = (start + end) / 2
        if array[middle] < target {
            start = middle + 1
        }
        else{
            end = middle
        }
    }
    return end
}

var maxnum = 0
var maxidx = 0

func LIS(arr:[Int]) -> Int {
    var lis = Array(repeating: 0, count: 1000)
    lis[0] = arr[0]
    var j = 0, i = 1
    while i < arr.count {
        if lis[j] < arr[i] {
            lis[j+1] = arr[i]
            j += 1
        }
        else {
            let idx = binary_search(s: 0, e: j, target: arr[i], array: lis)
            lis[idx] = arr[i]
        }
        i += 1
    }
    
    return j + 1
}

for i in 0..<n{
    let newarr = Array(input[0...i])
    answer[i] += LIS(arr: newarr)
}


input.reverse()

for i in 0..<n {
    let newarr = Array(input[0...i])
    answer[n-1-i] += LIS(arr: newarr)
}

print(answer.max()! - 1)
