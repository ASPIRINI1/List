//
//  DetailViewController.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.updateData = { [unowned self] in
            if let view = view as? DetailView {
                view.update(title: viewModel.post.title, description: viewModel.post.body)
            }
        }
        viewModel.viewLoaded()
    }
}
