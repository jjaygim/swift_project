//
//  JangBaModel.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 15..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import Foundation

struct JangBa {
    
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

    
}
