//
//  TableViewCell.swift
//  List
//
//  Created by Станислав Зверьков on 24.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identefier = "TableViewCell"
    
    func fill(post: Post) {
        self.titleLabel.text = post.title
    }
}
