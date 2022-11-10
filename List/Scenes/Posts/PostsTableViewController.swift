//
//  PostsTableViewController.swift
//  List
//
//  Created by Станислав Зверьков on 09.11.2022.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    private var viewModel: PostsViewModelProtocol
    
    init(viewModel: PostsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostsTableViewCell.self)
        viewModel.viewLoaded()
        viewModel.updateData = { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

//  MARK: UItableViewDataSource

extension PostsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(PostsTableViewCell.self, at: indexPath)
        guard let post = viewModel.posts?[indexPath.row] else { return cell }
        cell.fill(post: post)
        return cell
    }
}

//  MARK: UItableViewDelegate

extension PostsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.rowSelected(index: indexPath.row)
    }
}
