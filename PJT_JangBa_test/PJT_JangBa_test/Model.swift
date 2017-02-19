//
//  Model.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 19..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class Singleton {
    static let sharedInstance = Singleton()
    
    let date = Date()
    let dateFormatter = DateFormatter()
    
    var allData:Array<[String:String]> = []
    
    private init() {}
}

