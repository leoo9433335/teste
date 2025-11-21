//
//  AddTask.swift
//  teste
//
//  Created by aluno-22 on 21/11/25.
//

import SwiftUI

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    
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
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal)
                        TextField("More details about the task", text: $name, axis: .vertical)
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
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                        // Add action here
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
