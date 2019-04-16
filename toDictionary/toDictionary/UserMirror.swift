//
//  UserMirror.swift
//  反射
//
//  Created by 李元华 on 2019/4/16.
//  Copyright © 2019 李元华. All rights reserved.
//

import UIKit

let encoder = JSONEncoder()

protocol DictionaryValue {
    var value: Any { get }
}

extension Int: DictionaryValue { var value: Any {return self} }
extension Float: DictionaryValue { var value: Any {return self} }
extension Double: DictionaryValue { var value: Any {return self} }
extension String: DictionaryValue { var value: Any {return self} }
extension Bool: DictionaryValue { var value: Any {return self} }
extension Array: DictionaryValue where Element: DictionaryValue {
    var value: Any { return map { $0.value } }
}
extension Dictionary: DictionaryValue where Value: DictionaryValue {
    var value: Any { return mapValues { $0.value} }
}

extension DictionaryValue {
    var value: Any {
        let mirror = Mirror(reflecting: self)
        var result = [String : Any]()
        for child in mirror.children {
            guard let key = child.label else {
                fatalError("Invalid key in child: \(child)")
            }
            if let value = child.value as? DictionaryValue {
                result[key] = value.value
            } else {
                fatalError("Invalid value in child: \(child)")
            }
        }
        return result
    }
    
}
