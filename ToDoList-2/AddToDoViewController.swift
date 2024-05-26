//
//  AddToDoViewController.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-26.
//

import UIKit

class AddToDoViewController: UIViewController {
    lazy var mainContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter title"
        return textField
    }()
    
    lazy var prioritySegment: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: Priority.allCases.map { $0.rawValue })
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Add ToDo"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAdd))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveToDo))
        mainContainer.addArrangedSubview(titleTextField)
        mainContainer.addArrangedSubview(prioritySegment)
        view.addSubview(mainContainer)
        
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        prioritySegment.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            mainContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleTextField.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            titleTextField.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            prioritySegment.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8),
            prioritySegment.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            prioritySegment.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor)
        ])
        
    }
    @objc func cancelAdd() {
        dismiss(animated: true)
    }
    @objc func saveToDo() {
        
    }
}
