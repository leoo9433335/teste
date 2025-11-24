//
//  File.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import Foundation

enum TaskCategory: String, Identifiable, CaseIterable, Codable {
    var id: String { rawValue }
    
    case work = "Work"
    case study = "Study"
    case personal = "Personal"
    case family = "Family"
    

    var nameImage : String {
        switch  self {
        case .work:
            return "pills.fill"
        case .personal:
            return "person.fill"
        case .family:
            return "house.fill"
        case .study:
            return "graduationcap.fill"
        }
        
        
        
    }
}
