//
//  ContentView.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 3.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var context
    @State private var title: String = ""
    @Query private var todoItems: [TodoItem] = []
    
    // MARK: - Body
    var body: some View {
        VStack {
            TextField("enter title", text: $title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    saveTodoItem()
                }
            
            List(todoItems) {todoItem in
                Text(todoItem.title)
            }
            
            Spacer()
        }//: vStack
        .padding()
    }
    
    // MARK: - Functions
    private func saveTodoItem() {
        let todoItem = TodoItem(title: title)
        //save item
        context.insert(todoItem)
        
        //clean textfield
        title = ""
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
