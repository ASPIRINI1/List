//
//  CollectionViewController.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let manager = NetworkManager.shared
    var posts: [Post] = []
    
    override func viewDidLoad() {
        manager.getPosts { [unowned self] posts in
            guard let posts = posts else {
                self.posts.removeAll()
                return
            }
            self.posts = posts
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

//  MARK: - UICollectionViewDataSource

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identefier, for: indexPath) as? CollectionViewCell {
            cell.fill(post: posts[indexPath.row])
            return cell
        }
            return collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identefier, for: indexPath)
    }
}

//  MARK: - UICollectionViewDelegate

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
