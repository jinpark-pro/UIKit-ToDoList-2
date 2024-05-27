//
//  ToDoItem.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-25.
//

import Foundation

// Use CaseIterable to use allCases
enum Priority: String, CaseIterable, Codable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

class ToDoItem: Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: Priority
    
    init(title: String, isCompleted: Bool, priority: Priority) {
        self.title = title
        self.isCompleted = isCompleted
        self.priority = priority
    }
    
    enum CodingKeys: String, CodingKey {
        case title, isCompleted, priority
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        self.priority = try container.decode(Priority.self, forKey: .priority)
    }
}
