import Foundation

let input = readLine()!.split(separator: " ")
let subinput1 = input[0].map{String($0)}
let subinput2 = input[1].map{String($0)}

var new1 = ""
var new2 = ""
for i in (0...2).reversed() {
    new1 += subinput1[i]
    new2 += subinput2[i]
}

var num1 = Int(new1)!
var num2 = Int(new2)!

if num1 > num2 {
    print(num1)
}
else{
    print(num2)
}
