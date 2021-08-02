import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    var flag = true
    var rev = false
    var d = readLine()!
    d = d.replacingOccurrences(of: "RR", with: "")
    let f = Array(d)
    let _ = readLine()!
    var arr = readLine()!.components(separatedBy: ["[",",","]"," "]).filter({$0 != ""}).map{Int(String($0))!}
    for chr in f {
        if chr == "R" { // 뒤집는 경우.
            rev = !rev
        }
        else {  // 버리는 경우.
            if arr.isEmpty {    // 비어있는 경우.
                print("error")
                flag = false
                break
            }
            else {
                if !rev {
                    arr.removeFirst()
                }
                else
                {
                    arr.removeLast()
                }
            }
        }
    }
    
    if flag {
        if rev{
            arr.reverse()
            print(arr)
        }
        else{
            print(arr)
        }
    }
}
