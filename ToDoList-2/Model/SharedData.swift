//
//  SharedData.swift
//  ToDoList-2
//
//  Created by Jungjin Park on 2024-05-27.
//

import Foundation

class SharedData {
    private let TODOITEMS_JSON = "toDoItemsData.json"
    static let shared = SharedData()
    private var toDoItems: [ToDoItem] = []
    
    func getToDoItem(at index: Int) -> ToDoItem {
        toDoItems[index]
    }
    func getAllToDoItems() -> [ToDoItem] {
        let readOnlyToDoItems = toDoItems
        return readOnlyToDoItems
    }
    func addToDoItem(_ newToDoItem: ToDoItem) {
        toDoItems.append(newToDoItem)
    }
    func removeToDoItem(at index: Int) {
        toDoItems.remove(at: index)
    }
    // To save data to JSON
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    // JSON load and save
    func loadToDoItemsData() {
        let fileURL = getDocumentDirectory().appendingPathComponent(TODOITEMS_JSON)
        do {
            let data = try Data(contentsOf: fileURL)
            let toDoItemsData = try JSONDecoder().decode([ToDoItem].self, from: data)
            toDoItems = toDoItemsData
        } catch {
            print("Failed to read JSON data: \(error.localizedDescription)")
        }
    }
    func saveToDoItemsData() {
        let pathDirectory = getDocumentDirectory()
        try? FileManager.default.createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let fileURL = getDocumentDirectory().appendingPathComponent(TODOITEMS_JSON)
        let json = try? JSONEncoder().encode(toDoItems)
        do {
            try json!.write(to: fileURL)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }
    }
}
