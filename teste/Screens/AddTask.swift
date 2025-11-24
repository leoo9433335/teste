//
//  AddTask.swift
//  teste
//
//  Created by aluno-22 on 21/11/25.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var name: String = ""
    @State var details: String = ""
    @State var category: TaskCategory? = nil
    @State var informations:Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // todo: input name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Task")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal)
                        TextField("Your task here", text: $name, axis: .vertical)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
                    // categoria
                    HStack (spacing:12){
                        Image(systemName:category?.nameImage ?? "list.bullet")
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .foregroundStyle(.accent)
                            )
                        Text("Category")
                            .padding(.vertical,11)
                        Spacer()
                        
                        Menu{
                            
                            ForEach(TaskCategory.allCases){
                                category in
                                Button(category.rawValue, systemImage:category.nameImage){
                                    self.category = category
                                }
                            }
                            
                            
                        }label:{
                            HStack{
                                Text("select")
                                Image(systemName:"chevron.up.chevron.down")
                            }
                            
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(.backgroundTertiary)
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal)
                        TextField("More details about the task", text: $details, axis: .vertical)
                            .lineLimit(5...10)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            .background(.backgroundSecondary)
            .navigationTitle(Text("Add Task"))
            .navigationBarTitleDisplayMode(.inline)
            .alert("missing infos", isPresented: $informations, actions: {
                Button("Cancel", role: .cancel) { }
            })
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                        // Add action here
                        
                        if let category, !name.isEmpty, !details.isEmpty {
                            
                            let newtask = Task( name: name, details: details, category: category, iscompleted: false)
                            
                            modelContext.insert(newtask)
                            try? modelContext.save()
                            
                            dismiss()
                            
                            
            
                            
                            // TODO: handle adding the task and dismiss if needed
                        } else {
                            informations = true
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    AddTask()
}
