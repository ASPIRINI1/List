//
//  PostsFlowFactory.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

protocol PostsFlowFactoryProtocol {
    func createPostsTableViewController(router: RouterProtocol) -> UITableViewController
    func createDetailViewController(router: RouterProtocol) -> UIViewController
}

class PostsFlowFactory: PostsFlowFactoryProtocol {
    func createPostsTableViewController(router: RouterProtocol) -> UITableViewController {
        let viewModel = PostsViewModel(networkService: NetworkManager.shared, router: router)
        return PostsTableViewController(viewModel: viewModel)
    }
    
    func createDetailViewController(router: RouterProtocol) -> UIViewController {
        return UIViewController()
    }
}
    
