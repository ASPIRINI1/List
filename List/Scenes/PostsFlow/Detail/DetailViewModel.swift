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
    init(router: PostsFlowRouterProtocol, networkService: NetworkServiceProtocol, post: Post)
    func viewLoaded()
}

class DetailViewModel: DetailViewModelProtocol {
    var updateData: (() -> ())?
    var router: PostsFlowRouterProtocol
    var post: Post
    var networkService: NetworkServiceProtocol
    
    required init(router: PostsFlowRouterProtocol, networkService: NetworkServiceProtocol, post: Post) {
        self.router = router
        self.post = post
        self.networkService = networkService
    }
    
    func viewLoaded() {
        updateData?()
    }
    
    
}
