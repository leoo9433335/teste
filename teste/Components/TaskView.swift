//
//  TaskView.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import SwiftUI

struct TaskView: View {

    @Binding var task: Task

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                 task.iscompleted.toggle() // habilite quando o binding estiver sendo passado corretamente
            } label: {
                Image(systemName: task.iscompleted ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundStyle(task.iscompleted ? .accent: .gray3)
                    .frame(width: 22, height: 22)
            }
            Text(task.name)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 11)
        }
        .padding(.leading, 11)
    }
}

#Preview {
    TaskView(task: .constant(Task(name: "Almoçar", details: "no RU", category: .work, iscompleted: true)))
}
