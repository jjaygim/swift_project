//
//  FirstCustomCell.swift
//  PJT_JangBa_test
//
//  Created by 김재정 on 2017. 2. 20..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class FirstCustomCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var issLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var detailCLabel: UILabel!
    @IBOutlet weak var ccImageView: UIImageView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var memoImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reLoad"), object: nil)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
