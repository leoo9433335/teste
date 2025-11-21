//
//  tasks.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    @State
    var tasks: [Task] = [
        Task(name: "ryr", details: "dlld", category: .study, iscompleted: false),
        Task (name: "ryr3", details: "dlld3", category: .study, iscompleted: true),
        Task(name: "ryr2", details: "dlld2", category: .work, iscompleted: false),
    ]
    
    var groupedTasks: [TaskCategory: [Binding<Task>]] {
        Dictionary(grouping: $tasks, by: { $0.category.wrappedValue })
    }
    
    // Sorting categories by rawValue
    var sortedCategories: [TaskCategory] {
        groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    var body: some View {
        if tasks.isEmpty {
            EmptyStateView()
        } else {
            List(sortedCategories) { category in
                
                // Category Header
                HeaderView(taskCategory: category)
                    .listRowInsets(EdgeInsets())
                    .padding(.top, 20)
                
                if let categoryTasks = groupedTasks[category] {
                    ForEach(categoryTasks) { task in
                        TaskView(task: task)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(
                                task.id == categoryTasks.last?.id ? .hidden : .visible,
                                edges: .bottom
                            )
                    }
                }
            }
            .listStyle(.plain)
            .padding(.horizontal,10)
            
        }
    }
}



#Preview {
    Tasks()  // Previewing the view, not a single Task model
}

