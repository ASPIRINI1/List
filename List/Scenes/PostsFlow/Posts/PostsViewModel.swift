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
    init(networkService: NetworkServiceProtocol ,router: PostsFlowRouterProtocol)
}

class PostsViewModel: PostsViewModelProtocol {
    
    let networkService: NetworkServiceProtocol
    let router: PostsFlowRouterProtocol
    var posts: [Post]? {
        didSet {
            updateData?()
        }
    }
    var updateData: (() -> ())?
    
    required init(networkService: NetworkServiceProtocol, router: PostsFlowRouterProtocol) {
        self.networkService = networkService
        self.router = router
    }
    
    func viewLoaded() {
        NetworkService.shared.getPosts { posts in
            self.posts = posts
        }
    }
    
    func rowSelected(index: Int) {
        guard let post = posts?[index] else { return }
        router.pushToDetail(post: post, animated: true)
    }
}
