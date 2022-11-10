//
//  PostsTableViewCell.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(post: Post) {
        textLabel?.text = post.title
        detailTextLabel?.text = post.body
    }
}


