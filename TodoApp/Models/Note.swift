//
//  Note.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 4.10.2024.
//

import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var todoItem: TodoItem?
    
    init(title: String) {
        self.title = title
    }
}
