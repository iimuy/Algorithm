import Foundation

public class Person: NSObject {
    private var name: String
    private var age: Int
    public override init() {
        self.name = ""
        self.age = 111
        super.init()
    }
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    public override var description: String {
        return "{名字:\(name), 年龄:\(age)}"
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

