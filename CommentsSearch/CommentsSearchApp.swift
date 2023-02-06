//
//  CommentsSearchApp.swift
//  CommentsSearch
//
//  Created by Jessica on 6.02.23.
//

import SwiftUI

@main
struct CommentsSearchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
