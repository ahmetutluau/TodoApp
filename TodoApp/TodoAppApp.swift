//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 3.10.2024.
//

import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }.modelContainer(for: TodoItem.self)
        }
    }
}
