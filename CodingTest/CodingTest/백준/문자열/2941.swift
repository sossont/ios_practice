import Foundation

var input = readLine()!
let croatia = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for c in croatia{
    input = input.replacingOccurrences(of: c, with: "A")
}
print(input.count)
