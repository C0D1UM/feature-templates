// Codium UnWrapper

import Foundation
import UIKit

extension Optional {

    func unwrapOr<T>(_ value : T) -> T {
        return self as? T ?? value
    }
    
    var isNil : Bool {
        return self != nil ? false : true
    }
    
    var isNotNil : Bool {
        return self != nil ? true : false
    }
    
}

extension Optional where Wrapped == Date {
    var unwrap : Wrapped {
        return self.unwrapOr(Date())
    }
}

extension Optional where Wrapped == Bool {
    var unwrap : Wrapped {
        return self.unwrapOr(false)
    }
}

extension Optional where Wrapped == String {
    var unwrap : Wrapped {
        return self.unwrapOr("")
    }
}

extension Optional where Wrapped == Character {
    var unwrap : Wrapped {
        let char : Character = " "
        return self.unwrapOr(char)
    }
}

extension Optional where Wrapped == Int {
    var unwrap : Wrapped {
        return self.unwrapOr(Int(0))
    }
}

extension Optional where Wrapped == Int8 {
    var unwrap : Wrapped {
        return self.unwrapOr(Int8(0))
    }
}

extension Optional where Wrapped == Int16 {
    var unwrap : Wrapped {
        return self.unwrapOr(Int16(0))
    }
}

extension Optional where Wrapped == Int32 {
    var unwrap : Wrapped {
        return self.unwrapOr(Int32(0))
    }
}

extension Optional where Wrapped == Int64 {
    var unwrap : Wrapped {
        return self.unwrapOr(Int64(0))
    }
}

extension Optional where Wrapped == UInt {
    var unwrap : Wrapped {
        return self.unwrapOr(UInt(0))
    }
}

extension Optional where Wrapped == Double {
    var unwrap : Wrapped {
        return self.unwrapOr(Double(0))
    }
}

extension Optional where Wrapped == Float {
    var unwrap : Wrapped {
        return self.unwrapOr(Float(0))
    }
}

extension Optional where Wrapped == Float80 {
    var unwrap : Wrapped {
        return self.unwrapOr(Float80(0))
    }
}

@available(iOS 14.0, *)
extension Optional where Wrapped == Float16 {
    var unwrap : Wrapped {
        return self.unwrapOr(Float16(0))
    }
}

extension Optional where Wrapped == CGFloat {
    var unwrap : Wrapped {
        return self.unwrapOr(CGFloat(0))
    }
}

extension Optional where Wrapped == [Any] {
    var unwrap : Wrapped {
        return self.unwrapOr([])
    }
}

extension Optional where Wrapped == [String] {
    var unwrap : Wrapped {
        return self.unwrapOr([])
    }
}

extension Optional where Wrapped == [Int] {
    var unwrap : Wrapped {
        return self.unwrapOr([])
    }
}

extension Optional where Wrapped == [Bool] {
    var unwrap : Wrapped {
        return self.unwrapOr([])
    }
}

extension Optional where Wrapped == [String:Any] {
    var unwrap : Wrapped {
        return self.unwrapOr([:])
    }
}

extension Optional where Wrapped == [String:String] {
    var unwrap : Wrapped {
        return self.unwrapOr([:])
    }
}
