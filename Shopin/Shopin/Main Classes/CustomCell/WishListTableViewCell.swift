//
//  WishListTableViewCell.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class WishListTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_ItemNO: UILabel!
    @IBOutlet weak var productView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productView.layer.cornerRadius = 5
        productView.layer.borderWidth = 1
        productView.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
