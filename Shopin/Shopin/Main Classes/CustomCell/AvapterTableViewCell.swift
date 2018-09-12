//
//  AvapterTableViewCell.swift
//  Shopin
//
//  Created by Golden Work on 8/30/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class AvapterTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
