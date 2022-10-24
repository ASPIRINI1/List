//
//  CollectionViewController.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
}

//  MARK: - UICollectionViewDataSource

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

//  MARK: - UICollectionViewDelegate

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
