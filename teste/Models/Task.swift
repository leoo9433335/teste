//
//  task.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//


import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID = UUID()
    var name: String
    var details: String
    var category: TaskCategory
    var iscompleted: Bool 
    
    init( name: String, details: String, category: TaskCategory, iscompleted: Bool) {

        self.name = name
        self.details = details
        self.category = category
        self.iscompleted = iscompleted
    }
    
}
