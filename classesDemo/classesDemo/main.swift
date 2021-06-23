
let myOptional: String?

myOptional = "Harry"

// 1. check for nil value

if myOptional != nil{
    let text: String = myOptional!

}
else{
    print("myOptional is nil")
}

// 2. Optional Binding

if let safeOptional = myOptional{
    print(safeOptional)
}

// 3. Nil Coalescing Operator
let text:String = myOptional ?? ""

print(text)

// 4. force unwrapping

// 5. Optional Chaining

struct isOptional {
    var property = 123
    func method(){
        print("I am struct")
    }
}

let isoptioanl: isOptional?
isoptioanl = isOptional()
isoptioanl?.method()
print(isoptioanl?.property)
