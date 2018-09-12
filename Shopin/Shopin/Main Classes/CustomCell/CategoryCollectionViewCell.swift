//
//  CategoryCollectionViewCell.swift
//  Shopin
//
//  Created by Golden Work on 8/31/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img_Category: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.img_Category.layer.cornerRadius = self.img_Category.bounds.width/2
        self.img_Category.layer.masksToBounds = true        
    }
    
    override func layoutSubviews() {
        self.img_Category.layer.cornerRadius = self.img_Category.bounds.width/2
        self.img_Category.layer.masksToBounds = true
    }
}
