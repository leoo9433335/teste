//
//  testeApp.swift
//  teste
//
//  Created by aluno-22 on 18/11/25.
//

import SwiftUI
import SwiftData

@main
struct testeApp: App {
    var body: some Scene {
        WindowGroup {
            Tasks()
        }
        .modelContainer(for : Task.self)
    }
}
