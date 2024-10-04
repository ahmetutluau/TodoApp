//
//  EditTodoItemView.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 4.10.2024.
//

import SwiftUI

struct EditTodoItemView: View {
    @Bindable var todoItem: TodoItem
    
    var body: some View {
        TextField("Enter Title", text: $todoItem.title)
            .textFieldStyle(.roundedBorder)
    }
}
