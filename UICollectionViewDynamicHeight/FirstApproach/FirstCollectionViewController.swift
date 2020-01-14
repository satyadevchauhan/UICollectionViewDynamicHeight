//
//  FirstCollectionViewController.swift
//  UICollectionViewDynamicHeight
//
//  Created by Satyadev Chauhan on 23/03/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class FirstCollectionViewController: UICollectionViewController {
    
    let flowLayout = FirstFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    fileprivate func setupView() {
        title = "Approach 1"
        
        collectionView.alwaysBounceVertical = true
        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Approach2", style: .plain, target: self, action: #selector(secondVC))
    }
    
    @objc func secondVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondCollectionViewController")
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

// MARK: UICollectionViewDataSource

extension FirstCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CommonData.items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as! FirstCollectionViewCell
        cell.label.text = CommonData.items[indexPath.row]
        cell.layoutChanged = { [weak self] in
            self?.flowLayout.invalidateLayout()
        }
        return cell
    }
}

