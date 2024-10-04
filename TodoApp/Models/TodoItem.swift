//
//  TodoItem.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 3.10.2024.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    var title: String
    var iscompleted: Bool
    @Relationship(deleteRule: .cascade) var notes: [Note] = []
    
    init(title: String, iscompleted: Bool = false) {
        self.title = title
        self.iscompleted = iscompleted
    }
}
