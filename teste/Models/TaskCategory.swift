//
//  File.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import Foundation

enum TaskCategory: String, Identifiable {
    var id: String { rawValue }
    
    case work = "Work"
    case study = "Study"
    case personal = "Personal"
    case family = "Family"
    

    var nameImage : String {
        switch  self {
        case .work:
            return "🏢"
        case .personal:
            return "👨‍👩‍👧‍👦"
        case .family:
            return "👨‍👩‍👧‍👦"
        case .study:
            return ""
        }
        
        
        
    }
}
