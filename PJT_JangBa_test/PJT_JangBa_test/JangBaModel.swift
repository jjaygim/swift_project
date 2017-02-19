//
//  JangBaModel.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 15..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

class MySingleton {
    static let sharedInstance = MySingleton()
    
    //struct JangBa {
        
    var allData:Array<Array<String>> = []
    var getData:Array<String> = []
    
    let date = Date()
    var dateIndex0 = ""
    let dateFormatter = DateFormatter()
    
    var issIndex1 = ""
    
    var categoryIndex2:String = ""
    let incomeCategory = ["주수입","부수입","전월 이월"]
    let spendingCategory = ["식비", "주거/통신", "생활용품", "저축", "의복", "건강/문화", "육아/교육", "교통/차량", "세금", "경조사", "이자비용", "카드대금", "기타"]
    let savingCategory = ["예금","적금","기타"]
    
    var detailCIndex3 = ""
    
    var ccIndex4 = ""
    
    var moneyIndex5 = ""
    
    var memoIndex6 = ""

    private init() {}
}

/*
 
class singleton {
    static let sharedInstance = singleton()
}


 
 http://stackoverflow.com/questions/37379725/how-can-i-use-nscoding-with-a-singleton-class-in-swift
 
 class MySingleton : NSObject {
 class var sharedInstance: MySingleton {
 struct Statics {
 static var instance: MySingleton? = nil
 static var dispatchOnceToken: dispatch_once_t = 0
 }
 
 dispatch_once(&Statics.dispatchOnceToken) {
 if let data: NSData = .... (get your data here) {
 let decodedInstance = NSKeyedUnarchiver.unarchiveObjectWithData(data: data) as! MySingleton
 Statics.instance = decodedInstance
 } else {
 Statics.instance = MySingletion()
 }
 }
 return Statics.instance!
 }
 }
 
 */
