//
//  PostsViewModel.swift
//  List
//
//  Created by Станислав Зверьков on 09.11.2022.
//

import Foundation

protocol PostsViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var posts: [Post]? { get set }
    func viewLoaded()
    func rowSelected(index: Int)
}

protocol PostsViewProtocol {
    
}

class PostsViewModel: PostsViewModelProtocol {
    var posts: [Post]? {
        didSet {
            updateData?()
        }
    }
    
    var updateData: (() -> ())?
    
    deinit {
        print("VM deinit")
    }
    
    func viewLoaded() {
        NetworkManager.shared.getPosts { posts in
            self.posts = posts
        }
    }
    
    func rowSelected(index: Int) {
        
    }
}
