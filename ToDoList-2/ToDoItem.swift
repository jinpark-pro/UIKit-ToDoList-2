//
//  ToDoItem.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-25.
//

import Foundation

// Use CaseIterable to use allCases
enum Priority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct ToDoItem {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: Priority
    
    init(title: String, isCompleted: Bool, priority: Priority) {
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
    }
}

var DummyData: [ToDoItem] = [
    ToDoItem(title: "ToDo 1", isCompleted: true, priority: .high),
    ToDoItem(title: "ToDo 2", isCompleted: false, priority: .low),
    ToDoItem(title: "ToDo 3", isCompleted: false, priority: .medium),
    ToDoItem(title: "ToDo 4", isCompleted: false, priority: .low),
]
