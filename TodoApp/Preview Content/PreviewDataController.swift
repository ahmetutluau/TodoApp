//
//  PreviewDataController.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 3.10.2024.
//

import Foundation
import SwiftData

@MainActor
class PreviewDataController {
    static let container: ModelContainer = {
        do {
            let todoItemTitles = ["Mow the lawn", "Feed the dog", "Feed the rabbit", "Clean car"]
            let container = try ModelContainer(for: TodoItem.self, configurations: ModelConfiguration (isStoredInMemoryOnly: true))
            
            for index in 0..<4 {
                let todoItem = TodoItem(title: todoItemTitles[index])
                container.mainContext.insert(todoItem)
            }
            
            return container

            } catch {
                fatalError("Unable to initialize a container for previews.")
            }
    }()
}
