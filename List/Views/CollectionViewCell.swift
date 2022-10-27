//
//  CollectionViewCell.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identefier = "CollectionViewCell"
    
    func fill(post: Post) {
        self.titleLabel.text = post.title
    }
}
