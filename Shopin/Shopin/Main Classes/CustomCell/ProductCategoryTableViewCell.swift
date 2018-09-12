//
//  ProductCategoryTableViewCell.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class ProductCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var lbl_Category: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var img_Product: UIImageView!
    @IBOutlet weak var lbl_ItemName: UILabel!
    @IBOutlet weak var lbl_ItemPrice: UILabel!
    @IBOutlet weak var lbl_ItemBrand: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 10
        categoryView.layer.masksToBounds = true
        categoryView.layer.borderWidth = 1
        categoryView.layer.borderColor = UIColor.lightGray.cgColor
        
//        categoryView.layer.masksToBounds = false
//        categoryView.layer.shadowColor = UIColor.black.cgColor
//        categoryView.layer.shadowOpacity = 0.5
//        categoryView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        categoryView.layer.shadowRadius = 1
//
//        categoryView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        categoryView.layer.shouldRasterize = true
//        categoryView.layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
//        productView.layer.borderColor = UIColor.gray.cgColor
//        productView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
