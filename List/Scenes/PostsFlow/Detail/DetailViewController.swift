//
//  DetailViewController.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol
    lazy var customView = DetailView(frame: view.frame)
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        viewModel.updateData = { [unowned self] in
            customView.update(title: viewModel.post.title, description: viewModel.post.body)
        }
        viewModel.viewLoaded()
        customView.postButtonDidTap = { [unowned self] in
            self.viewModel.postButtonPressed()
        }
    }
}
