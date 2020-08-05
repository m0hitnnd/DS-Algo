import UIKit


struct A {
 var x: String = "abc"
 var y: B = B(str: "123")
}


class B {
var val: String
init(str: String) {
 self.val = str
}
}


var a = A()
a.x = "abc"

var a2 = A()
a2.x = "def"

print(a.x) // abc
print(a2.x) // def

print(a.y.val) // 123
print(a2.y.val) //123


let a3 = a

a.x = "ghi"
a.y.val = "567"

print(a.x) //ghi
print(a3.x) // abc

print(a.y.val) // 567
print(a3.y.val) // 123
