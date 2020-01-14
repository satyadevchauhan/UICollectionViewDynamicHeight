//
//  ThirdCollectionViewCell.swift
//  UICollectionViewDynamicHeight
//
//  Created by Satyadev Chauhan on 25/09/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    
    static let reuseId = "ThirdCollectionViewCell"
    
    var layoutChanged: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        // Tries to fit contentView to the target size in layoutAttributes
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        //Update layoutAttributes with height that is just calculated
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)   //Round to half pixels
        
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }

    @IBAction func buttonAction(_ sender: Any) {
        buttonHeight.constant = 0
        button.setTitle("", for: .normal)
        layoutChanged?()
    }
}
