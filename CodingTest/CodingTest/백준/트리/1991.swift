import Foundation

class Node {
    var data: Substring
    var left: Substring
    var right: Substring
    
    init(_ data : Substring, _ left : Substring, _ right:Substring) {
        self.data = data
        self.left = left
        self.right = right
    }
}

func preorder(_ node: Node){
    print(node.data,terminator: "")
    if node.left != "." {
        preorder(tree[String(node.left)]!)
    }
    if node.right != "." {
        preorder(tree[String(node.right)]!)
    }
}

func inorder(_ node: Node){
    if node.left != "." {
        inorder(tree[String(node.left)]!)
    }
    print(node.data,terminator: "")
    if node.right != "." {
        inorder(tree[String(node.right)]!)
    }
}

func postorder(_ node: Node)
{
    if node.left != "." {
        postorder(tree[String(node.left)]!)
    }
    if node.right != "." {
        postorder(tree[String(node.right)]!)
    }
    print(node.data,terminator: "")
}

let n = Int(readLine()!)!
var tree: [String:Node] = [:]
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    tree[String(input[0])] = Node(input[0], input[1], input[2])
}


preorder(tree["A"]!)
print()
inorder(tree["A"]!)
print()
postorder(tree["A"]!)
