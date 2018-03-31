//
//  TableViewCellConfig.swift
//  testURL
//
//  Created by HsuKaiChieh on 31/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewCellConfig: UITableViewCell {
    @IBOutlet weak var lblShow: UILabel!    
    @IBOutlet weak var switchShow: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
