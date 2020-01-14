//
//  SecondCollectionViewController.swift
//  UICollectionViewDynamicHeight
//
//  Created by Satyadev Chauhan on 23/03/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class SecondCollectionViewController: UICollectionViewController {
    
    var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    fileprivate func setupView() {
        title = "Approach 2"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Approach3", style: .plain, target: self, action: #selector(thirdVC))
        
        // Register cell classes
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SecondCollectionViewCell.reuseId)
        
        if let newlayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout = newlayout
            flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 158)
        }
    }
    
    @objc func thirdVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdCollectionViewController")
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}

// MARK: UICollectionViewDataSource

extension SecondCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CommonData.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseId, for: indexPath) as! SecondCollectionViewCell
        cell.subtitleLabel.text = CommonData.items[indexPath.row]
        cell.layoutChanged = { [weak self] in
            self?.flowLayout.invalidateLayout()
        }
        return cell
    }
}
