import Foundation

let arr = readLine()!.map{String($0)}
var array : [Int] = Array(repeating: 0, count: 26)
var ascii = Int(Character("a").asciiValue!)
for char in arr{
    let lowerchar = char.lowercased()
    let index = Int(Character(lowerchar).asciiValue!) - ascii
    array[index] += 1
}

var max = 0
for count in array{
    if max < count{
        max = count
    }
}
var maxcount = 0
var maxindex = 0
for i in 0...array.count-1 {
    if max == array[i]{
        maxcount += 1
        maxindex = i
    }
    
    if maxcount >= 2{
        break
    }
}

if maxcount >= 2{
    print("?")
}
else{
    let char = Character(UnicodeScalar(maxindex + Int(Character("A").asciiValue!))!)
    print(char)
}
