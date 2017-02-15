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
 
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var categoryDetail: UITextField!
    @IBOutlet weak var chooseCardCash: UISegmentedControl!
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var memo: UITextView!
    
    var jangba : JangBa
    
    required init?(coder aDecoder: NSCoder) {
        //date1 = date1()
        jangba = JangBa()
        jangba.dateFormatter.dateFormat = "yyyy.MM.dd"
        //jangba.dateFormatter.dateStyle = .short
        jangba.dateIndex0 = jangba.dateFormatter.string(from: jangba.date)
        jangba.issIndex1 = "수입"
        jangba.categoryIndex2 = jangba.incomeCategory[0]
        jangba.ccIndex4 = "카드"
        
        super.init(coder: aDecoder)
    }

        override func viewDidLoad() {
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        super.viewDidLoad()
        
        //memo = UITextView(frame: CGRect(x: 0, y: 0, width: 343, height: 107))
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
        jangba.dateFormatter.dateFormat = "yyyy.MM.dd"
        
        jangba.dateIndex0 = jangba.dateFormatter.string(from: datePicker.date)
        //jangba.getData.append(jangba.dateFormatter.string(from: datePicker.date))
        
    }
    
    func numberOfComponents(in: UIPickerView)->Int {
        return 1
    }
    func pickerView(_: UIPickerView, numberOfRowsInComponent: Int)->Int {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            return jangba.spendingCategory.count
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            return jangba.savingCategory.count
        }
        else
        {
            return jangba.incomeCategory.count
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow: Int, forComponent: Int) -> String? {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            return jangba.spendingCategory[titleForRow]
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            return jangba.savingCategory[titleForRow]
        }
        else
        {
            return jangba.incomeCategory[titleForRow]
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        if(segmentedControl.selectedSegmentIndex == 1)
        {
            jangba.categoryIndex2 = jangba.spendingCategory[didSelectRow]
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            jangba.categoryIndex2 = jangba.savingCategory[didSelectRow]
        }
        else
        {
            jangba.categoryIndex2 = jangba.incomeCategory[didSelectRow]
        }
    }

    @IBAction func datePickerChanged(_ sender: Any) {
        setDate()
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {

        if(segmentedControl.selectedSegmentIndex == 1)
        {
            jangba.issIndex1 = "지출"
            //jangba.getData.append("지출")
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            jangba.issIndex1 = "저축"
            //jangba.getData.append("저축")
        }
        else
        {
            jangba.issIndex1 = "수입"
            //jangba.getData.append("수입")
        }
        categoryPicker.reloadAllComponents()
    }
  
    @IBAction func segmentedCardCash(_ sender: Any) {
        
        if(chooseCardCash.selectedSegmentIndex == 1)
        {
            jangba.ccIndex4 = "현금"
            //jangba.getData.append("현금")
        }
        else
        {
            jangba.ccIndex4 = "카드"
            //jangba.getData.append("카드")
        }
    }
    

    
    @IBAction func savedButton(_ sender: Any) {
        
        jangba.detailCIndex3 = String(describing: categoryDetail.text)
        jangba.moneyIndex5 = String(describing: money.text)
        
        if let index6 = memo.text
            {
            jangba.memoIndex6 = String(describing: memo.text)
            }
        else
            {
            jangba.memoIndex6 = ""
            }
    
        jangba.getData.append(jangba.dateIndex0)
        jangba.getData.append(jangba.issIndex1)
        jangba.getData.append(jangba.categoryIndex2)
        jangba.getData.append(jangba.detailCIndex3)
        jangba.getData.append(jangba.ccIndex4)
        jangba.getData.append(jangba.moneyIndex5)
        jangba.getData.append(jangba.memoIndex6)
        //getData.append(String(describing: categoryDetail.text))
        //getData.append(String(describing: money.text))
        //getData.append(String(describing: memo.text))
        
        jangba.allData.append(jangba.getData)
        
        //self.navigationController?.popViewController(animated: true)
        
        func pop(animated: Bool) {
            _ = navigationController?.popViewController(animated: true)
        }
        pop(animated: true)
        
        print(jangba.getData)
        print(jangba.allData)
 
        
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
