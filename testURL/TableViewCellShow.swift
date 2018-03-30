//
//  TableViewCellShow.swift
//  testURL
//
//  Created by KaiChieh on 27/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewCellShow: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUpdated: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
