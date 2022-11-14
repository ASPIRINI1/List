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
        addViewModelListeners()
        customView.postButtonDidTap = { [unowned self] in
            guard let text = customView.descriptionTextView.text else { return }
            self.viewModel.postButtonPressed(title: text)
        }
    }
    
    func addViewModelListeners() {
        viewModel.updateData = { [unowned self] in
            DispatchQueue.main.async {
                self.customView.update(title: self.viewModel.post.title, description: self.viewModel.post.body)
            }
        }
        viewModel.viewLoaded()
        viewModel.postStatus = { [unowned self] success in
            DispatchQueue.main.async {
                var alert: UIAlertController
                if success {
                    alert = .init(title: "Success", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Go back", style: .default) { _ in
                        self.viewModel.goBackPressed()
                    })
                } else {
                    alert = .init(title: "Fail", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                }
                self.present(alert, animated: true)
            }
        }
    }
}
