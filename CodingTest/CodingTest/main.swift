import Foundation

var t = Int(readLine()!)!
var result = [Int]()
while t >= 1 {
    let n = Int(readLine()!)!
    var apply = [[Int]]()
    
    // 지원자의 각 성적 입력받기. index가 지원자의 번호라고 생각하면 된다.
    for _ in 0..<n {
        apply.append(readLine()!.split(separator: " ").map{Int(String($0))!})

    }
    var answer = 1
    apply.sort { $0[0] < $1[0] }
    var mininterview = apply[0][1]   // 나보다 순위 높은 애들중에 최대값.
    for i in 1..<apply.count {  // 서류 성적 1등은 무조건 통과임. 그래서 2등부터.
        
        // 원래는 2중 for문을 사용했으나, 시간을 줄이기 위함.
        if mininterview > apply[i][1] {
            answer += 1
            mininterview = apply[i][1]
        }
        
    }
    result.append(answer)
    t-=1
}

for answer in result {
    print(answer)
}
