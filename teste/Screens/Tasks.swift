//
//  tasks.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import SwiftUI
import SwiftData

struct Tasks: View {
    
    
    @Environment(\.modelContext) var modelContext
    
    @Query var tasks: [Task]
    
    
    @State var addTask:Bool = false
    
    
    
    
    
    var groupedTasks: [TaskCategory: [Task]] {
        Dictionary(grouping: tasks, by: { $0.category })
    }
    
    // Sorting categories by rawValue
    var sortedCategories: [TaskCategory] {
        groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                if tasks.isEmpty {
                    EmptyStateView(AddTask: $addTask)
                } else {
                    List(sortedCategories) { category in
                        
                        // Category Header
                        HeaderView(taskCategory: category)
                            .listRowInsets(EdgeInsets())
                            .padding(.top, 20)
                            .listRowSeparator(.hidden, edges: .top)
                        
                        if let categoryTasks = groupedTasks[category] {
                            ForEach(categoryTasks) { task in
                                TaskView(task: task)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(
                                        task.id == categoryTasks.last?.id ? .hidden : .visible,
                                        edges: .bottom
                                    )
                                    .swipeActions(edge: .trailing){
                                        Button("Delete",systemImage: "trash",role: .destructive){
                                            modelContext.delete(task)
                                            try? modelContext.save()
                                            
                                        }
                                    }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal,10)
                    
                }
            }
            .sheet(isPresented: $addTask, content: {
                AddTask()
                    .presentationDragIndicator(.visible)
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add",systemImage: "plus"){
                        addTask=true
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
            }
        }
    }
    
}

#Preview {
    Tasks()  // Previewing the view, not a single Task model
}

