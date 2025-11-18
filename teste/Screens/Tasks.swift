//
//  tasks.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    var tasks: [Task] = [
        Task(name: "ryr", details: "dlld", category:.study, iscompleted: false)
        ]
    
    var groupedTasks: [TaskCategory: [Task]] {
            Dictionary(grouping: tasks, by: { $0.category })
        }

        var sortedCategories: [TaskCategory] {
            groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue })
        }

    
    
    var body: some View {
        
        
        if tasks.isEmpty {
                    EmptyStateView()
                } else {

                    List(sortedCategories) { category in

                                    // header
                                    HeaderView(taskCategory: category)
                        padding(.top, 20)

                                        if let categoryTasks = groupedTasks[category] {

                                            ForEach(categoryTasks) { task in
                                                TaskView(task: task)
                                                    .listRowInsets(EdgeInsets())
                                                    .listRowSeparator(task.id == categoryTasks.last!.id ? .hidden : .visible, edges: .bottom)
                                            }
                                        }
                                    }
                                    .listStyle(.plain)
                                }
        }
        
        
        
        
        
    }
    


#Preview {
    Task(name: "ryr", details: "dlld", category:.study, iscompleted: false)
}
