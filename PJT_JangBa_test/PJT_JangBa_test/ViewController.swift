//
//  ViewController.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 13..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //UITableViewCell,
    
    //네비게이션바 위에 버튼은 사이즈가 왜 자동설정되나?
    
    //년 월 일 따로 생성
    //새로운 년월 딕셔너리 생성 [년:[월:[년:,월:,일;,iss:,...]]]
    //yearNMonth라벨하고 테이블뷰 데이터 매칭, 
    //월별 금액 라벨 테이블뷰 데이터 계산해서 보여주기 --> 전월이월금액 자동 계산
    //애드뷰 저장할 때마다 뷰리로드
    //테이블뷰-->수정뷰(데이터 갖고있기, 수정하기)
    //수정뷰 저장할 때마다 뷰리로드
    //날짜이동버튼<> 누를때마다 뷰리로드
    //램
    
    
    @IBOutlet weak var yearNMonth: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var spendingNSaving: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var listTable: UITableView!
 
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var issLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var detailCLabel: UILabel!
    @IBOutlet weak var ccImageView: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var memoImageView: UIImageView!
    
    
    var jangba : Singleton
    
    required init?(coder aDecoder: NSCoder) {
        jangba = Singleton.sharedInstance
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTable.dataSource = self
        listTable.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FirstCustomCell", forIndexPath: indexPath) as! FirstCustomCell
// 위 작업을 마치면 커스텀 클래스의 outlet을 사용할 수 있다.
        cell.dateLabel.text = jangba.allData[indexPath.row]["0date"]
        cell.issLabel.text = jangba.allData[indexPath.row]["1iss"]
        cell.categoryLabel.text = jangba.allData[indexPath.row]["2category"]
        cell.detailCLabel.text = jangba.allData[indexPath.row]["3detailC"]
        //cell.ccImageView.image = UIImage(named: images[indexPath.row]["4cc"])
        cell.moneyLabel.text = jangba.allData[indexPath.row]["5money"]
        //cell.memoImageView.image = UIImage(named: images[indexPath.row]["6memo"])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jangba.allData.count
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



