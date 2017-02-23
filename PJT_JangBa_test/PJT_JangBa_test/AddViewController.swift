//
//  addViewController.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 14..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit


class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //텍스트필드 높이 어떻게 조정하는지?//테두리
    //저장버튼이 왜 네비게이션바에 가려지나?
    //빈칸 터치하면 글자 없어지게?
    //피커뷰 설정안하면 데이터 안잡힘
    //피커뷰 지출 로우 설정 안됨
    
    //수입 지출 적금 바꿀때마다 피커뷰 초기화하는 방법 (피커뷰 카테고리가 수입지출적금과 연동돼서 인덱스 따라 움직임)
    //겟데이터 배열세트 !!딕셔너리로 컨트롤러에 만들기
 
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var categoryDetail: UITextField!
    @IBOutlet weak var chooseCardCash: UISegmentedControl!
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var memo: UITextView!
    
    //var jangba : Singleton
    
    var getData : [String: String]
    
    var dateIndex0 : String
    var issIndex1 : String
    var categoryIndex2:String
    
    let incomeCategory : [String]
    let spendingCategory : [String]
    let savingCategory : [String]
    
    var detailCIndex3 : String
    var ccIndex4 : String
    var moneyIndex5 : String
    var memoIndex6 : String
    
    required init?(coder aDecoder: NSCoder) {
        //date1 = date1()
        //jangba = Singleton.sharedInstance
        Singleton.sharedInstance.dateFormatter.dateFormat = "yy.MM.dd"
        
        //Singleton.sharedInstance.yearFormatter.dateFormat = "yyyy"
        //Singleton.sharedInstance.monthFormatter.dateFormat = "MM"
        //Singleton.sharedInstance.dayFormatter.dateFormat = "dd"
        //jangba.dateFormatter.dateStyle = .short
        
        getData = [:]  //["0date":"","1iss":"","2category":"","3detailC":"","4cc":"","5money":"","6memo":""]
        
        incomeCategory = ["주수입","부수입","전월 이월"]
        spendingCategory = ["식비", "주거/통신", "생활용품", "저축", "의복", "건강/문화", "육아/교육", "교통/차량", "세금", "경조사", "이자비용", "카드대금", "기타"]
        savingCategory = ["예금","적금","기타"]
        
        //dateIndex0 = Singleton.sharedInstance.dateFormatter.string(from: Singleton.sharedInstance.date)
        dateIndex0 = Singleton.sharedInstance.dateFormatter.string(from: Singleton.sharedInstance.date)
        dateIndex0 = Singleton.sharedInstance.dateFormatter.string(from: Singleton.sharedInstance.date)
        dateIndex0 = Singleton.sharedInstance.dateFormatter.string(from: Singleton.sharedInstance.date)
        issIndex1 = "수입"
        categoryIndex2 = incomeCategory[0]
        detailCIndex3 = ""
        ccIndex4 = "카드"
        moneyIndex5 = ""
        memoIndex6 = ""
        
        super.init(coder: aDecoder)
    }

        override func viewDidLoad() {
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        super.viewDidLoad()
        
        //memo = UITextView(frame: CGRect(x: 0, y: 0, width: 343, height: 107)) 인스턴스 새로 생성(아웃렛하고 또하면 안됨)
        memo.layer.cornerRadius = 5
        //memo.layer.borderColor = UIColor.gray as! CGColor
        //let grey = UIColor(colorLiteralRed: 100, green: 100, blue: 100, alpha: 1)
        //memo.layer.borderColor = grey.cgColor
        memo.layer.borderWidth = 0.3
        memo.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDate() {
        //jangba.dateFormatter.dateStyle = .short
        //Singleton.sharedInstance.dateFormatter.dateFormat = "yy.MM.dd"
        
        dateIndex0 = Singleton.sharedInstance.dateFormatter.string(from: datePicker.date)
        //jangba.getData.append(jangba.dateFormatter.string(from: datePicker.date))
        
    }
    
    func numberOfComponents(in: UIPickerView)->Int {
        return 1
    }
    func pickerView(_: UIPickerView, numberOfRowsInComponent: Int)->Int {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            return spendingCategory.count
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            return savingCategory.count
        }
        else
        {
            return incomeCategory.count
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow: Int, forComponent: Int) -> String? {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            return spendingCategory[titleForRow]
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            return savingCategory[titleForRow]
        }
        else
        {
            return incomeCategory[titleForRow]
        }
    }
    
    func selectRow(_ row: Int, inComponent component: Int, animated: Bool){
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            categoryIndex2 = spendingCategory[didSelectRow]
            //if didSelectRow == nil {
              //  jangba.categoryIndex2 = jangba.spendingCategory[0]
            //}
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            categoryIndex2 = savingCategory[didSelectRow]
        }
        else
        {
            categoryIndex2 = incomeCategory[didSelectRow]
        }
    }

    @IBAction func datePickerChanged(_ sender: Any) {
        setDate()
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {

        if(segmentedControl.selectedSegmentIndex == 1)
        {
            issIndex1 = "지출"
            categoryIndex2 = spendingCategory[0]
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            issIndex1 = "저축"
            categoryIndex2 = savingCategory[0]
        }
        else
        {
            issIndex1 = "수입"
            categoryIndex2 = incomeCategory[0]
        }
        categoryPicker.reloadAllComponents()  //*******
    }
  
    @IBAction func segmentedCardCash(_ sender: Any) {
        
        if(chooseCardCash.selectedSegmentIndex == 1)
        {
            ccIndex4 = "현금"
        }
        else
        {
            ccIndex4 = "카드"
        }
    }
    

    
    @IBAction func savedButton(_ sender: Any) {
        
        //var dataset = ["날짜":"","수지저":"","카테고리":"","세부카테고리":"","항목":"","카현":"","금액":"","메모":""]
        
        detailCIndex3 = categoryDetail.text!
        moneyIndex5 = money.text!
        memoIndex6 = memo.text!
        
        /*
        if let index6 = memo.text
            {
            memoIndex6 = String(describing: memo.text)
            }
        else
            {
            memoIndex6 = ""
            }
         */
        getData["0date"] = dateIndex0
        getData["1iss"] = issIndex1
        getData["2category"] = categoryIndex2
        getData["3detailC"] = detailCIndex3
        getData["4cc"] = ccIndex4
        getData["5money"] = moneyIndex5
        getData["6memo"] = memoIndex6

        
        //jangba.getData.append(jangba.dateIndex0)
        //jangba.getData.append(jangba.issIndex1)
        //jangba.getData.append(jangba.categoryIndex2)
        //jangba.getData.append(jangba.detailCIndex3)
        //jangba.getData.append(jangba.ccIndex4)
        //jangba.getData.append(jangba.moneyIndex5)
        //jangba.getData.append(jangba.memoIndex6)
        
        //getData.append(String(describing: categoryDetail.text))
        //getData.append(String(describing: money.text))
        //getData.append(String(describing: memo.text))
        
        Singleton.sharedInstance.allData.append(getData)
        
        //self.navigationController?.popViewController(animated: true)
        
        func pop(animated: Bool) {
            _ = navigationController?.popViewController(animated: true)
        }
        pop(animated: true)
        
        print(getData)
        print(Singleton.sharedInstance.allData)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
 
        
    }
    

    
    
    
    
/*
    @IBAction func chooseIncomeSpendingSaving(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            textLabel.text = "First selected";
        case 1:
            textLabel.text = "Second Segment selected";
        default:
            break; 
        }
    }
 */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
