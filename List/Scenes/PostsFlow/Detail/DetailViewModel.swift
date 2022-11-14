//
//  DetailViewModel.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var postStatus: ((Bool) -> ())? { get set }
    var post: Post { get }
    init(router: PostsFlowRouterProtocol, networkService: NetworkServiceProtocol, post: Post)
    func viewLoaded()
    func postButtonPressed(title: String)
    func goBackPressed()
}

class DetailViewModel: DetailViewModelProtocol {
    
    var updateData: (() -> ())?
    var postStatus: ((Bool) -> ())?
    var post: Post
    var router: PostsFlowRouterProtocol
    var networkService: NetworkServiceProtocol
    
    required init(router: PostsFlowRouterProtocol, networkService: NetworkServiceProtocol, post: Post) {
        self.router = router
        self.post = post
        self.networkService = networkService
    }
    
    func viewLoaded() {
        updateData?()
    }
    
    func postButtonPressed(title: String) {
        post.title = title
        networkService.pushPost(post: self.post) { success in
            self.postStatus?(success)
        }
    }
    
    func goBackPressed() {
        router.popBack(animated: true)
    }
}
