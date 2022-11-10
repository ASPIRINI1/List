//
//  DetailView.swift
//  List
//
//  Created by Станислав Зверьков on 10.11.2022.
//

import UIKit

class DetailView: UIView {

    var titleLabel = {
        let label = UILabel()
        label.text = "Title"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var descriptionlabel = {
        let label = UILabel()
        label.text = "Description"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var titleTextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var descriptionTextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(descriptionlabel)
        addSubview(titleTextField)
        addSubview(descriptionTextView)
        setNeedsUpdateConstraints()
    }
    
    func update(title: String?, description: String?) {
        titleTextField.text = title
        descriptionTextView.text = description
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        descriptionlabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8).isActive = true
        descriptionlabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        descriptionlabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        descriptionTextView.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 8).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
