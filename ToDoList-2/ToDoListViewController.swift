//
//  ViewController.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-25.
//

import UIKit

class ToDoListViewController: UIViewController, AddToDoViewControllerDelegate, UITableViewDataSource {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        return tableView
    }()
    
    var toDoItems: [ToDoItem] = SharedData.shared.getAllToDoItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ToDo List"
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newToDo))
        SharedData.shared.loadToDoItemsData()
    }
    @objc func newToDo() {
        let addToDoViewController = AddToDoViewController()
        let navController = UINavigationController(rootViewController: addToDoViewController)
        addToDoViewController.delegate = self
        present(navController, animated: true)
    }
    
    func saveToDo(_ toDoItem: ToDoItem) {
        SharedData.shared.addToDoItem(toDoItem)
        SharedData.shared.saveToDoItemsData()
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SharedData.shared.getAllToDoItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        let toDoItem = SharedData.shared.getToDoItem(at: indexPath.row)
        cell.titleLabel.text = toDoItem.title
        cell.priorityLabel.text = toDoItem.priority.rawValue
        cell.accessoryType = toDoItem.isCompleted ? .checkmark : .none
        
        return cell
    }
}
