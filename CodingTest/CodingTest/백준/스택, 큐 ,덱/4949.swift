import Foundation

while(true){
    let sepinput = readLine()!
    if sepinput == "."{
        break
    }
    var stack:[String.Element] = []
    var stackindex = -1 // top을 가리키는 index
    var flag = true
    for char in sepinput{
        if char == "["
        {
            stack.append("[")
            stackindex += 1
        }
        else if char == "]"{
            if stackindex == -1 || stack[stackindex] != "["
            {
                flag = false
                break
            }
            stack.remove(at: stackindex)
            stackindex -= 1
        }
        else if char == "("
        {
            stack.append("(")
            stackindex += 1
        }
        else if char == ")"
        {
            if stackindex == -1 || stack[stackindex] != "("
            {
                flag = false
                break
            }
            stack.remove(at: stackindex)
            stackindex -= 1
        }
    }
    if flag && stack.isEmpty
    { // 정상적으로 끝났을 때.
        print("yes")
    }
    else
    {
        print("no")
    }
}


