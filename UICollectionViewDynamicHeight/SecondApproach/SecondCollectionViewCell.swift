//
//  SecondCollectionViewCell.swift
//  UICollectionViewDynamicHeight
//
//  Created by Satyadev Chauhan on 23/03/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    
    static let reuseId = "SecondCollectionViewCell"
    
    var layoutChanged: (() -> Void)?
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .red
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        buttonHeight.constant = 0
        button.setTitle("", for: .normal)
        layoutChanged?()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}
