//
//  PostsFlowFactory.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

protocol PostsFlowFactoryProtocol {
    func createPostsTableViewController(router: PostsFlowRouterProtocol) -> UITableViewController
    func createDetailViewController(router: PostsFlowRouterProtocol, post: Post) -> UIViewController
}

class PostsFlowFactory: PostsFlowFactoryProtocol {
    func createPostsTableViewController(router: PostsFlowRouterProtocol) -> UITableViewController {
        let viewModel = PostsViewModel(networkService: NetworkManager.shared, router: router)
        return PostsTableViewController(viewModel: viewModel)
    }
    
    func createDetailViewController(router: PostsFlowRouterProtocol, post: Post) -> UIViewController {
        let viewModel = DetailViewModel(router: router, post: post)
        return DetailViewController(viewModel: viewModel)
    }
}
    
