//
//  DetailViewModel.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var post: Post { get }
    init(router: RouterProtocol, post: Post)
    func viewLoaded()
}

class DetailViewModel: DetailViewModelProtocol {
    var updateData: (() -> ())?
    var post: Post
    
    required init(router: RouterProtocol, post: Post) {
        self.post = post
    }
    
    func viewLoaded() {
        updateData?()
    }
    
    
}
