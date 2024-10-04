//
//  TodoItemDetailView.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 4.10.2024.
//

import SwiftUI
import SwiftData

struct TodoItemDetailView: View {
    let todoItem: TodoItem
    @State var noteTitle: String = ""
    
    var body: some View {
        Form {
            TextField("enter note title", text: $noteTitle)
            
            Button(action: {
                let note = Note(title: noteTitle)
                todoItem.notes.append(note)
                noteTitle = ""
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            
            List(todoItem.notes) {note in
                Text(note.title)
            }
        }
        .navigationTitle(todoItem.title)
    }
}

struct TodoItemDetailContainer: View {
    @Query var todoItem: [TodoItem]
    
    var body: some View {
        TodoItemDetailView(todoItem: todoItem[0])
    }
}

#Preview {
    NavigationStack {
        TodoItemDetailContainer()
    }.modelContainer(PreviewDataController.container)
}
