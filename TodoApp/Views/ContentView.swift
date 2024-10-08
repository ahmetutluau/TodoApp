//
//  ContentView.swift
//  TodoApp
//
//  Created by Ahmet Utlu on 3.10.2024.
//

import SwiftUI
import SwiftData

enum  FilterOptions: Identifiable, CaseIterable {
    case inComplete
    case complete
    var id: FilterOptions { self }
    
    var title: String {
        switch self {
        case .inComplete:
            "Incompleted"
        case .complete:
            "completed"
        }
    }
}

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var context
    @State private var title: String = ""
    @Query private var todoItems: [TodoItem] = []
    @State private var selectedFilter: FilterOptions = .inComplete
    @FocusState private var isfocused: Bool
    
    var filteredItems: [TodoItem] {
        switch selectedFilter {
        case .inComplete:
            return todoItems.filter { $0.iscompleted == false }
        case .complete:
            return todoItems.filter { $0.iscompleted == true }
        }
    }
    // MARK: - Body
    var body: some View {
        VStack {
            TextField("enter title", text: $title)
                .textFieldStyle(.roundedBorder)
                .focused($isfocused)
                .onSubmit {
                    saveTodoItem()
                }
                .onAppear(perform: {
                    isfocused = true
                })
            
            Picker("SelectfilterOptions", selection: $selectedFilter) {
                ForEach(FilterOptions.allCases) { option in
                    Text(option.title)
                        .tag(option)
                }
            }.pickerStyle(.segmented)
            
            List {
                ForEach(filteredItems) { todoItem in
                    @Bindable var todoItem = todoItem
                    
                    NavigationLink(destination: 
                                    TodoItemDetailView(todoItem: todoItem)
                    ) {
                        HStack {
                            Image(systemName: todoItem.iscompleted ? "checkmark.square" : "square")
                                .onTapGesture {
                                    todoItem.iscompleted.toggle()
                                }
                            TextField("Todo Title", text: $todoItem.title)
                                .textFieldStyle(.roundedBorder)
                                .disabled(todoItem.iscompleted ? true : false)
                                .fixedSize()
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    delete(indexSet)
                })
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
        
        //focused to textfield
        isfocused = true
    }
    
    func delete(_ indexSet: IndexSet) {
        print("indexset: \(indexSet)")
        indexSet.forEach { index in
            let todoItem = filteredItems[index]
            context.delete(todoItem)
            print("index: \(index)")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }.modelContainer(PreviewDataController.container)
}
