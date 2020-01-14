//
//  ThirdCollectionViewController.swift
//  UICollectionViewDynamicHeight
//
//  Created by Satyadev Chauhan on 25/09/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ThirdCollectionViewController: UICollectionViewController {
    
    var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    fileprivate func setupView() {
        title = "Approach 3"
        
        if let newlayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout = newlayout
            flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 150)
        }
    }
}

// MARK: UICollectionViewDataSource

extension ThirdCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CommonData.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseId, for: indexPath) as! ThirdCollectionViewCell
        cell.label.text = CommonData.items[indexPath.row]
        cell.layoutChanged = { [weak self] in
            self?.flowLayout.invalidateLayout()
        }
        return cell
    }
}
