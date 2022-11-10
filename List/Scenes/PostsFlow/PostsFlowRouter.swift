//
//  Router.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController { get }
    func popBack(animated: Bool)
}

protocol PostsFlowRouterProtocol: RouterProtocol {
    func pushToDetail(post: Post, animated: Bool)
}

class PostsFlowRouter: PostsFlowRouterProtocol {
    var navigationController = UINavigationController()
    var postsFlowFactory: PostsFlowFactoryProtocol
    
    init(postsFlowFactory: PostsFlowFactoryProtocol) {
        self.postsFlowFactory = postsFlowFactory
        self.navigationController = UINavigationController(rootViewController: postsFlowFactory.createPostsTableViewController(router: self))
    }
    
    func popBack(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func pushToDetail(post: Post, animated: Bool) {
        navigationController.pushViewController(postsFlowFactory.createDetailViewController(router: self, post: post), animated: animated)
    }
}
