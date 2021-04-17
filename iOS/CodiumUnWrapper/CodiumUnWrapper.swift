// Codium UnWrapper

import Foundation
import UIKit

extension Optional {

    func unWrapOr<T>(_ value : T) -> T {
        if let val = self as? T {
            return val
        } else {
            return value
        }
    }
    
    var isNil : Bool {
        guard self != nil else {return true}
        return false
    }
    
    var isNotNil : Bool {
        guard self != nil else {return false}
        return true
    }
    
}

extension Optional where Wrapped == Date {
    var unWrap : Wrapped {
        return self.unWrapOr(Date())
    }
}

extension Optional where Wrapped == Bool {
    var unWrap : Wrapped {
        return self.unWrapOr(false)
    }
}

extension Optional where Wrapped == String {
    var unWrap : Wrapped {
        return self.unWrapOr("")
    }
}

extension Optional where Wrapped == Character {
    var unWrap : Wrapped {
        let char : Character = " "
        return self.unWrapOr(char)
    }
}

extension Optional where Wrapped == Int {
    var unWrap : Wrapped {
        return self.unWrapOr(Int(0))
    }
}

extension Optional where Wrapped == Int8 {
    var unWrap : Wrapped {
        return self.unWrapOr(Int8(0))
    }
}

extension Optional where Wrapped == Int16 {
    var unWrap : Wrapped {
        return self.unWrapOr(Int16(0))
    }
}

extension Optional where Wrapped == Int32 {
    var unWrap : Wrapped {
        return self.unWrapOr(Int32(0))
    }
}

extension Optional where Wrapped == Int64 {
    var unWrap : Wrapped {
        return self.unWrapOr(Int64(0))
    }
}

extension Optional where Wrapped == UInt {
    var unWrap : Wrapped {
        return self.unWrapOr(UInt(0))
    }
}

extension Optional where Wrapped == Double {
    var unWrap : Wrapped {
        return self.unWrapOr(Double(0))
    }
}

extension Optional where Wrapped == Float {
    var unWrap : Wrapped {
        return self.unWrapOr(Float(0))
    }
}

extension Optional where Wrapped == Float80 {
    var unWrap : Wrapped {
        return self.unWrapOr(Float80(0))
    }
}

@available(iOS 14.0, *)
extension Optional where Wrapped == Float16 {
    var unWrap : Wrapped {
        return self.unWrapOr(Float16(0))
    }
}

extension Optional where Wrapped == CGFloat {
    var unWrap : Wrapped {
        return self.unWrapOr(CGFloat(0))
    }
}

extension Optional where Wrapped == [Any] {
    var unWrap : Wrapped {
        return self.unWrapOr([])
    }
}

extension Optional where Wrapped == [String] {
    var unWrap : Wrapped {
        return self.unWrapOr([])
    }
}

extension Optional where Wrapped == [Int] {
    var unWrap : Wrapped {
        return self.unWrapOr([])
    }
}

extension Optional where Wrapped == [Bool] {
    var unWrap : Wrapped {
        return self.unWrapOr([])
    }
}

extension Optional where Wrapped == [String:Any] {
    var unWrap : Wrapped {
        return self.unWrapOr([:])
    }
}

extension Optional where Wrapped == [String:String] {
    var unWrap : Wrapped {
        return self.unWrapOr([:])
    }
}

