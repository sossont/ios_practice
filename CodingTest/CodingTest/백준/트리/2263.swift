import Foundation

var inorder:[Int] = Array(repeating: 0, count: 100001)
var inorderidx = Array(repeating: 0, count: 100001)
var postorder:[Int] = Array(repeating: 0, count: 100001)


let n = Int(readLine()!)!

func preord(_ inordbegin: Int, _ inordend: Int, _ postordbegin: Int, _ postordend: Int){
    if inordbegin > inordend || postordbegin > postordend {
        return
    }

    let root = postorder[postordend]
    print(root,terminator: " ")
    preord(inordbegin, inorderidx[root]-1, postordbegin, postordbegin + inorderidx[root] - inordbegin - 1)
    preord(inorderidx[root] + 1, inordend, postordbegin + inorderidx[root] - inordbegin, postordend - 1)
    
}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<n {
    inorder[i] = input[i]
    inorderidx[input[i]] = i
}
let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<n {
    postorder[i] = input2[i]
}

preord(0, n-1, 0, n-1)
