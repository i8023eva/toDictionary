//
//  Person.swift
//  反射
//
//  Created by 李元华 on 2019/4/16.
//  Copyright © 2019 李元华. All rights reserved.
//

import UIKit

typealias DictionaryResult = DictionaryValue & Codable

struct Person: DictionaryResult {
    let name: String
    let age: Int
}

struct Family {
    let name: String
    let person: Person
    
    init(with dict: [String : Any]) {
        name = dict["name"] as! String
        person = dict["person"] as! Person
    }
    
    func toDictionary() -> [String : Any] {
        return ["name" : name,
                "person" : person
               ]
    }
}

struct Man: Codable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func toDictionary() -> [String : Any] {
        var dict: Any = ""
        do {
            let data = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: data, options: [])
        } catch  {
            print(error)
        }
        return dict as! [String : Any]
    }

}

