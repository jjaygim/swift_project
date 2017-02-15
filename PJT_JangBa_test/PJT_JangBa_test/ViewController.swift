//
//  ViewController.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 13..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //네비게이션바 위에 버튼은 사이즈가 왜 자동설정되나?
    
    
    @IBOutlet weak var yearNMonth: UILabel!
    
    @IBOutlet weak var income: UILabel!
    
    @IBOutlet weak var spendingNSaving: UILabel!
    
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backMonth(_ sender: Any) {
    }
    
    @IBAction func forwardMonth(_ sender: Any) {
    }

    
   /* @IBAction func addContent(_ sender: Any) {
        let addVC : AddViewController = storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        
        if let navigation = navigationController {
            navigation.pushViewController(addVC, animated: true)
        }
        else {
            self.present(addVC, animated: true, completion: nil)
        }

    }*/

}



