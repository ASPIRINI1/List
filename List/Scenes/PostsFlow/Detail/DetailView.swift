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
    var titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    var descriptionTextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.systemGray5.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var postButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 31))
        button.setTitle("Post", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var postButtonDidTap: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        addSubview(titleLabel)
        addSubview(descriptionlabel)
        addSubview(titleTextField)
        addSubview(descriptionTextView)
        addSubview(postButton)
        setNeedsUpdateConstraints()
    }
    
    func update(title: String?, description: String?) {
        titleTextField.text = title
        descriptionTextView.text = description
    }

    @objc private func postButtonAction(_ sender: UIButton) {
        postButtonDidTap?()
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
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        postButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 8).isActive = true
        postButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        postButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
