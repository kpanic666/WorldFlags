//
//  CountryNameCellTableViewCell.swift
//  WorldFlags
//
//  Created by Andrei Korikov on 15.10.2021.
//

import UIKit
import CoreGraphics

class CountryNameCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.layer.borderColor = UIColor.gray.cgColor
        imageView?.layer.borderWidth = 1
    }
}
