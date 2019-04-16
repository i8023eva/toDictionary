//
//  ViewController.swift
//  toDictionary
//
//  Created by 李元华 on 2019/4/16.
//  Copyright © 2019 李元华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lyh = Person(name: "", age: 22)
        print(lyh.value)
        
        let dict: [String : Any] = ["name" : "qwer",
                                    "person" : lyh
                                   ]
        let family = Family(with: dict)
        print(family.toDictionary())
        
        let yhx = Man(name: "lyh")
        print(yhx.toDictionary())
    }


}

