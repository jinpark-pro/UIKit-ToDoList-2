//
//  ViewController.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-25.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        return tableView
    }()
    
    let toDoItems: [ToDoItem] = DummyData
    
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
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        let toDoItem = toDoItems[indexPath.row]
        cell.titleLabel.text = toDoItem.title
        cell.priorityLabel.text = toDoItem.priority.rawValue
        cell.accessoryType = toDoItem.isCompleted ? .checkmark : .none
        
        return cell
    }
}
