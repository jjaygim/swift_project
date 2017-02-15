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
 

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var categoryDetail: UITextField!
    @IBOutlet weak var chooseCardCash: UISegmentedControl!
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var memo: UITextView!
    

    var allData:Array<Array<String>> = [[]]
    var getData:Array<String> = []
    
    var getType:String = ""
    let pickerCategory = ["식비", "주거/통신", "생활용품", "저축", "의복", "건강/문화", "육아/교육", "교통/차량", "세금", "경조사", "이자비용", "카드대금", "기타"]
    
    override func viewDidLoad() {
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        super.viewDidLoad()
        
        memo = UITextView(frame: CGRect(x: 0, y: 0, width: 343, height: 107))
        memo.layer.cornerRadius = 5
        //memo.layer.borderColor = UIColor.black
        memo.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in: UIPickerView)->Int {
        return 1
    }
    func pickerView(_: UIPickerView, numberOfRowsInComponent: Int)->Int {
        return pickerCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow: Int, forComponent: Int) -> String? {
        return pickerCategory[titleForRow]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        getType = pickerCategory[didSelectRow]
    }

    @IBAction func segmentedControlAction(_ sender: Any) {
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            getData.append("수입")
        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            getData.append("지출")
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            getData.append("저축")
        }
    }
  
    @IBAction func segmentedCardCash(_ sender: Any) {
        
        if(chooseCardCash.selectedSegmentIndex == 0)
        {
            getData.append("카드")
        }
        else if(chooseCardCash.selectedSegmentIndex == 1)
        {
            getData.append("현금")
        }
    }
    

    
    @IBAction func savedButton(_ sender: Any) {
        
        //getData.append(String(describing: categoryDetail.text))
        //getData.append(String(describing: money.text))
        //getData.append(String(describing: memo.text))
        
        //allData.append(getData)
        
        //self.navigationController?.popViewController(animated: true)
        
        func pop(animated: Bool) {
            _ = navigationController?.popViewController(animated: true)
        }
        pop(animated: true)
 
        
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
